//
//  ViewController.swift
//  DatePicker
//
//  Created by 한소희 on 2022/06/20.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector : Selector = #selector(DateViewController.updateTime) // 타이머가 구동되면 실행할 함수 지정s
    let interval = 1.0  // 타이머의 간격 값. 1.0은 1초를 의미
    var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // timeInterval : 타이머 간격, target : 동작될 view, selector : 타이머가 구동될 때 실행할 함수, userInfo : 사용자 정보 repeats : 반복여부
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        /* 데이터 피커를 선택할 때 발생하는 액션 함수인 'changeDatePicker' 가 호출되면서 sender라는
        UIDatePicker 자료형의 인수가 전달됨. 이 sender를 datePickerView라는 상수에 저장함.
         */
        let formatter = DateFormatter() // 날짜를 출력하기 위하여 DateFormatter라는 클래스 상수 formatter 선언
        formatter.dateFormat = "yyyy-MM-dd:mm EEE" // formatter의 dateFormat 속성을 설정
        lblPickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
        /* 데이터 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포멧대로 string 메서드를 사용하여 문자열로 변환.
         "선택 시간 : " 이라는 문자열에 위에서 문자열로 변환한 date 값을 추가하여 lblPickerTime의 text에 넣음.
         */
    }
    
    @objc func updateTime() { // Switf4 에서는 #selector() 의 인자로 사용될 메서드를 선언할 때 @obj 키워드를 붙여야 함.
        /* lblCurrentTime.text = String(count)  // String으로 변환한 count 값을 lblCurrentTime 레이블의 text 속성에 저장
        count += 1 */
        
        let date = NSDate()  // 현재 시간을 NSDate 함수를 사용하여 가져옴.
        
        let formatter = DateFormatter() // 날짜 출력을 위해 DateFormatter 라는 클래스의 상수 formatter 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
        /* formatter.string(date) 은 피커 뷰에서 선택한 날짜를 formatter의 dateFromat에서 설정한 포멧대로 string 메서드를 사용하여 문자열로 반환.
            lblCurrentTime.text = "현재 시간 : " + 는 "현재 시간 : " 이라는 String 위에서 String 으로 변환한 date 값을 추가 하여
            lblCurrentTime의 text에 넣음
         */
    }
    
}

