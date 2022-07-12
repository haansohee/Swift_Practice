//
//  ViewController.swift
//  DrawaGraphics
//
//  Created by 한소희 on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)  // 콘텍스트를 이미지 뷰의 크기와 같게 생성.
        let context = UIGraphicsGetCurrentContext()!  // 생성한 콘텍스트의 정보를 가져옴.
        
        //Draw Line  // 콘텍스트에 대한 여러 가지 설정을 함.
        context.setLineWidth(2.0)  // 선의 굵기는 2.0으로 설정.
        context.setStrokeColor(UIColor.red.cgColor)  // 해당 콘텍스트의 선 색상은 빨간색으로 설정.
        
        context.move(to: CGPoint(x: 70, y: 50))  // 시작 위치로 커서를 이동. (0, 0)은 화면의 왼쪽 윗부분의 지표, 여기서는 시작 위치를 (70, 50)으로 지정.
        context.addLine(to: CGPoint(x: 270, y: 250))  // 현재 위치에서 지정한 위치까지 선을 추가함. 그리고 싶은 선은 계속 이어서 추가할 수 있음.                                                                여기서는 임의로 (270, 250)을 입력함.
        
        context.strokePath()  // 추가한 경고를 콘텍스트에 그림.
        
        //Draw Triangle  // Draw Line에서 사용한 방법으로 삼각형 그림.
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)  // 선의 색은 파란색으로 설정하고,
        
        context.move(to: CGPoint(x: 170, y: 200))  // 삼각형의 꼭지점이 세개이므로 context.addLine 좌표를 다르게 하여 세 번 입력함.
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()  // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 나타냄.
        UIGraphicsEndImageContext()  // 그림 그리기를 끝냄.
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))  // xy 좌표 (70, 100)에서 시작하고 폭이 200px, 높이가 200px인 삼각형을 그림.
        // 이떄 시작하는 좌표인 (70, 100)은 완성된 사각형에서 왼쪽 위의 꼭지점을 말함.
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))  // xy 좌표 (70, 50)에서 시작하고 폭이 200px, 높이가 100px인 사각형 안에                                                                         내접하는 타원을 그림.
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))  // xy 좌표 (70, 200)에서 시작하고 폭이 200px, 높이가 200px인 사각형                                                                             안에 내접하는 원을 그림. 폭과 높이를 같에 설정하면 원을 그릴 수 있음.
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        // 현재 위치에서 두 개의 접점 (250, 50), (250, 200) 사이에 내접한 반지름이 50인 호를 그리겠다는 뜻임.
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)  // 도형 내부를 색상으로 채움. red 자리에 blue, green 등의 다른 색상 값이 들어갈 수 있음.
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)  // 사각형의 내부를 색상으로 채움.
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        //Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}

