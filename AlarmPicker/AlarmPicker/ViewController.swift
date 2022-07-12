//
//  ViewController.swift
//  AlarmPicker
//
//  Created by 한소희 on 2022/06/22.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime : String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime() {  // 타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
        // count 값을 문자열로 변환하여 lblCurrentTime.text에 출력
        // lblCurrentTime.text = String(count)
        // count += 1
        
        let date = NSDate()  // 현재 시간을 가져옴
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime)
        {
            view.backgroundColor = UIColor.red
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
    }
}

