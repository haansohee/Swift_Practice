//
//  ViewController.swift
//  TapTouch
//
//  Created by 한소희 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 터치 이벤트 메서드 구현하기. 터치 이벤트를 사용하기 위해서는 터치 이벤트가 발생했을 때 호출되는 메서드를 사용자가 재정의해야 함.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {  // 터치가 시작될 때 호출됨.
        let touch = touches.first! as UITouch  // 현재 발생한 터치 이벤트를 가지고 옴.
        txtMessage.text = "Touches Began"  // 메서드에서 현재 발생한 이벤트의 종류를 출력함.
        txtTapCount.text = String(touch.tapCount)  // touches 세트 안에 포함된 터치의 개수를 출력함.
        txtTouchCount.text = String(touches.count)  // 터치 객체들 중 첫 번째 객체에서 탭의 개수를 가져와 출력함.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {  // 터치된 손가락이 움직였을 때 호출됨.
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {  // 화면에서 손가락을 떼었을 때 호출됨.
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Ended"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }


}

