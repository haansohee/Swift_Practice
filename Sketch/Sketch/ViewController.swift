//
//  ViewController.swift
//  Sketch
//
//  Created by 한소희 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    var lastPoint : CGPoint!  // 바로 전에 터치하거나 이동한 위치
    var lineSzie : CGFloat = 2.0  // 선의 두께
    var lineColor = UIColor.red.cgColor  // 선의 색상
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil  // imgView에 nil을 넣음. 즉, 이미지 뷰의 이미지를 없애는 것.
    }
    
    // 터치 이벤트 메서드 재정의하기.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {  // 사용자가 터치하면 스케치를 시작하는 메서드
        let touch = touches.first! as UITouch  // 현재 발생한 터치 이벤트를 가지고 옴.
        
        lastPoint = touch.location(in: imgView)  // 터치된 위치를 lastPoint에 저장.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {  // 사용자가 터치한 손가락을 움직이면 스케치도 따라서 움직이는 메서드
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)  // 라인의 끝 모양을 라운드로 설정.
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSzie)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)  // 터치된 위치를 currPoint로 가지고 옴.
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        // 현재 이미지 뷰에 있는 이미지를 이미지 뷰의 크기로 그림.
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))  // 이전에 이동된 위치인 lastPoint로 시작 위치를 이동시킴.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))  // lastPoint에서 현재 위치인 currPoint까지 선을 추가.
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint  // 현재 터치된 위치를 lastPoint라는 변수에 할당함.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {  // 사용자가 화면에서 손가락을 떼었을 때 스케치가 끝나는 메서드
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSzie)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 사용자가 iOS 기기를 흔들었을 때 이미지 뷰 위에 그렸던 스케치가 지워지도록 하는 메서드
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake  // shake라는 모션 이벤트가 발생한 경우,
        {
            imgView.image = nil  // 이미지 뷰의 이미지를 nil 처리
        }
    }

}

