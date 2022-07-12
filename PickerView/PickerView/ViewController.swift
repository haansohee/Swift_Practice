//
//  ViewController.swift
//  PickerView
//
//  Created by 한소희 on 2022/06/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    let MAX_ARRAY_NUM = 10  // 이미지의 파일명을 저장할 배열의 최대 크기 지정
    let PICKER_VIEW_COLUMN = 1  // 피커뷰의 열의 개수 지정
    let PICKER_VIEW_HEIGHT : CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                        "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ] // 이미지 파일 저장할 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {  // i 변수를 0부터 MAX_ARRAY_NUM보다 작을 때까지 루프 실행
            let image = UIImage(named: imageFileName[i])
            /* image 라는 변수 선언. imageFileName[i] 에 있는 파일명을 사용하여 UIImage 타입의 이미지 생성.
             생성한 이미지를 image 라는 변수에 할당함.*/
            imageArray.append(image)  // imageArray에 방금 만든 imgae 추가.
        }
        
        lblImageFileName.text = imageFileName[0]  // lblImageFileName 레이블에 ImageFileName 배열의 첫번째 파일명 출력.
        imageView.image = imageArray[0]  // 이미지 뷰에 첫번째 이미지 나타남.
    }
    
    // return the number of. columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
        /* 피커 뷰에게 컴포넌트의 수를 정수 값으로 넘겨 주는 델리게이트 메서드. 피커 뷰의 컴포넌트는 피커 뷰에 표시되는
        열의 개수를 의미함. 여기서는 PICKER_VIEW_COLUMN의 값인 1을 넘겨줌. */
    }
    
    // return the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
        /* numberOfRowsInComponent 인수를 가지는 델리게이트 메서드. 피커 뷰에게 컴포넌트의 열의 개수를
         정수 값으로 넘겨줌. 이 값은 피커 뷰의 해당 열에서 선택할 수 있는 행의 개수(데이터 개수)를 의미함.
         여기에서는 배열 imageFileName의 개수 값인 10을 imageFileName.count를 사용하여 넘겨줌.*/
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // return imageFileName[row]
        /* titleForRow 인수를 가지는 델리게이트 메서드. 피커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열 값으로 넘겨줌.
         여기서는 imageFileName에 저장되어 있는 파일명을 넘겨줌.*/
    // }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {  // 피커 뷰에게 컴포넌트의 각 열의 뷰를 UIView 타입의 값으로 넘겨줌. 여기서는 이미지뷰에 저장되어 있는                                이미지 넘겨줌.
        let imageView = UIImageView(image: imageArray[row])  // 선택된 row에 해당하는 이미지를 imageArray에서 가져옴.
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        /* 사용자가 피커 뷰의 룰렛에서 선택한 row 값을 사용하여 imageFileName 배열에서 row 값에 해당하는 문자열을
         가지고 옴. 그리고 가져 온 문자열을 레이블의 아웃렛 변수는 lblImageFileName.text에 저장.*/
        imageView.image = imageArray[row]
        /* 사용자가 피커 뷰의 룰렛에서 선택한 row 값을 사용하여 imageArray 배열에서 row 값에 해당하는 이미지를 가지고 옴.
         그리고 가져 온 이미지를 이미지 뷰의 아웃렛 변수인 imageView.image에 저장함.*/
    }


}

