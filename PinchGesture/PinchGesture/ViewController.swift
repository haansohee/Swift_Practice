//
//  ViewController.swift
//  PinchGesture
//
//  Created by 한소희 on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtPinch: UILabel!
    var initialFontSize : CGFloat!  // 핀치 제스처가 발생했을 때 현재 글자 크기를 저장할 변수
    
    @IBOutlet var imgPinch: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    // 핀치 제스처가 인식되었을 때 실행되는 액션 메서드
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        
        pinch.scale = 1
        // if (pinch.state == UIGestureRecognizer.State.began)  // 핀치 제스처 상태를 state 속성을 사용하여 확인
        // {
           //  initialFontSize = txtPinch.font.pointSize  // 제스처 상태가 시작이면 initalFontSize에 현재 텍스트 글자 크기 저장
        // }
        // else
        // {
            //txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)  // 시작 상태가 아니라면 핀치 제스처가 계속 진행되고 있는 상태이므로 initialFontSize에 저장해 둔 글자 크기 값에 scale 속성을 곱하여 텍스트 글자 크기에 반영
        //}
    }


}

