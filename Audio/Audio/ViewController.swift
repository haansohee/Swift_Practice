//
//  ViewController.swift
//  Audio
//
//  Created by 한소희 on 2022/06/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate
{
    var audioPlayer : AVAudioPlayer!  // AVAudioPlayer 인스턴스 변수
    var audioFile : URL!  // 재생할 오디오의 파일명 변수
    let MAX_VOLUME : Float = 10.0  // 최대 볼륨, 실수형 상수
    var progressTimer : Timer!  // 타이머를 위한 변수
    
    let timePlayerSelector : Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector : Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet var pvProgressPlay: UIProgressView!
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    var audioRecorder : AVAudioRecorder!  // audioRecorder 인스턴스 추가.
    var isRecordMode = false  // 현재 '녹음 모드'라는 것을 나타낼 isRecordMode 추가. 가본값은 false로 하여 처음 앱 실행하였을 때 '재생 모드'가 나타나게 함.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")  // 오디오 파일 추가
        selectAudioFile()
        
        if !isRecordMode  // 재생 모드
        {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        }
        else  // 녹음 모드
        {
            initRecord()
        }
        
    }
    
    // 녹음 파일 생성하기
    func selectAudioFile() {
        if !isRecordMode  // 재생 모드일 때는 오디오 파일 선택됨.
        {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }
        else  // 녹음 모드일 때는 새 파일인 recordFile.m4a 가 생성됨.
        {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    // 녹음을 위한 초기화
    func initRecord() {
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleIMA4 as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0] as [String : Any]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            print("Error-initRecord : \(error)")
        }
        

        audioRecorder.delegate = self
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("Error-setCategory : \(error)")
        }
        
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive : \(error)")
        }
    }
    
    // 오디오 재생을 위한 초기화
    func initPlay() {
        // 앞서 초기화한 audioFile을 URL로 하는 audioPlayer 인스턴스 생성.
        // 이때 AVAudioPlayer 함수는 입력 파라미터인 오디오 파일이 없을 때에 대비하여 do-try-catch문을 사용.
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }
        catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        
        // 오디오 재생 시 필요한 모든 값 초기화하는 코드
        slVolume.maximumValue = MAX_VOLUME  // 슬라이더의 최대 볼륨을 MAX_VOLUME (10.0) 으로 초기화.
        slVolume.value = 1.0  // 슬라이더의 볼륨을 1.0으로 초기화.
        pvProgressPlay.progress = 0  // 프로그레스 뷰의 진행을 0으로 초기화.
        
        audioPlayer.delegate = self  // audioPlayer의 델리게이트를 self로 함.
        audioPlayer.prepareToPlay()  // prepareToPlay() 를 실행.
        audioPlayer.volume = slVolume.value  // audioPlayer의 볼륨을 방금 앞에서 초기화한 슬라이더의 볼륨 값 1.0으로 초기화.
        
        // lblEndTime에 총 재생 시간(오디오 곡 길이)을 나타내기 위해 lblEndTime 초기화.
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)  // 오디오 파일의 재생 시간인 audioPlayer.duration 값을 convertNsTimeInterval2String 함수를 이용해 lblEndTime 텍스트에 출력.
        lblCurrentTime.text = convertNSTimeInterval2String(0)  // lblCurrentTime 텍스트에는 00:00가 나오도록 0 입력
        
        // play 버튼은 오디오를 재생하는 역할을 하고 다른 두 버튼은 오디오를 멈추게 하므로 paly 버튼만 활성화.
        // btnPlay.isEnabled = true
        // btnPause.isEnabled = false
        // btnStop.isEnabled = false
        setPlayButtons(true, pause: false, stop: false)
    }
    
    func setPlayButtons(_ play : Bool, pause : Bool, stop : Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    // 재생 시간을 "00:00"으로 바꾸기 위한 함수.
    func convertNSTimeInterval2String(_ time : TimeInterval) -> String {
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format : "%0.2d:%0.2d", min, sec)
        return strTime
    }

    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()  // audioPlayer.play 함수를 실행해 오디오 재생.
        setPlayButtons(false, pause: true, stop: true)  // play버튼은 비활성화, 나머지 두 버튼은 활성화.
        
        // 타이머(NSTimer)를 이용하여 재생 시간 작동되도록 구현.
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayTime() {
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        // 재생 시간인 audioPlayer.currentTime을 레이블 lblCurrentTime 에 나타냄.
        
        pvProgressPlay.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
        // 프로그레스 뷰인 pvProgressPlay의 진행 상황에 audioPlayer.currentTime을 audioPlayer.duration으로 나눈 값으로 표시.
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        // 오디오를 정지하고 다시 재생하면 처음부터 재생해야 하므로 audioPlayer.currentTime을 0으로 함.
        
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        // 재생 시간도 00:00으로 초기화하기 위하여 converNSTimeinterval2String(0) 활용
        
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
        // 타이머도 무효화.
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        // 볼륨 조절.
        audioPlayer.volume = slVolume.value
    }
    
    // 오디오 재생이 끝나면 맨 처음 상태로 돌아가도록 하는 함수. 타이머도 무효화하고 버튼도 다시 정의.
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()  // 타이머 무효화.
        setPlayButtons(true, pause: false, stop: false)  // play 버튼만 활성화.
    }
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        // 스위치 on : 녹음모드, off : 재생 모드
        if sender.isOn
        {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        }
        else
        {
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        
        selectAudioFile()
        
        if !isRecordMode
        {
            initPlay()
        }
        else
        {
            initRecord()
        }
    }
    
    
    @IBAction func btnRecord(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record"  // 만약 버튼 이름이 "Record" 라면
        {
            audioRecorder.record()  // 녹음을 하고
            (sender as AnyObject).setTitle("Record", for: UIControl.State())  // 버튼 이름을 "Record"으로 변경.
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)  // 녹음할 때 타이머가 작동하도록 progressTimer에 Timer.scheduledTimer 함수를 사용하는데, 0.1초 간격으로 타이머 설정
        }
        else  // 그렇지 않으면
        {
            audioRecorder.stop()  // 현재 녹음중이므로 녹음을 중단하고
            progressTimer.invalidate()  // (녹음이 중지되면 타이머를 무효화)
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())  // 버튼 이름을 "Stop"으로 변경.
            btnPlay.isEnabled = true  // 그리고 [Play] 버튼을 활성화하고
            initPlay()  // 방금 녹음한 파일로 재생을 초기화함
        }
        
    }
    
    @objc func updateRecordTime() {
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    
}

