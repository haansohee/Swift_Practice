//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 한소희 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    let numberOfTouchs = 2  // 원하는 터치의 개수
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    
    // 각 방향별로 검은색과 빨간색 이미지를 저장하기 위해 배열 선언.
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 배열에 이미지 할당.
        imgUp.append(UIImage(named: "images/arrow-up-black.png")!)
        imgUp.append(UIImage(named: "images/arrow-up-red.png")!)
        imgUp.append(UIImage(named: "images/arrow-up-green.png")!)
        imgDown.append(UIImage(named: "images/arrow-down-black.png")!)
        imgDown.append(UIImage(named: "images/arrow-down-red.png")!)
        imgDown.append(UIImage(named: "images/arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "images/arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "images/arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "images/arrow-left-green.png")!)
        imgRight.append(UIImage(named: "images/arrow-right-black.png")!)
        imgRight.append(UIImage(named: "images/arrow-right-red.png")!)
        imgRight.append(UIImage(named: "images/arrow-right-green.png")!)
        // 배열을 UIImage형으로 만들었기 때문에 append의 인수로 UIImage형의 값을 입력함. 스와이프 하면 검은색 화살표가 빨간색이 되도록 하기 위해 처음에는 검은색 화살표의 파일명, 그 뒤에는 빨간색의 화살표의 파일명을 입력하는 식.
        
        // 할당한 각 이미지 배열의 첫 번째 인자를 이미지 뷰에 할당.
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // 스와이프 제스처 인식하기.
        // 위쪽 방향의 스와이프 제스처
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGesture(_:)))
        // UISwipeGestureRecognizer 클래스 상수 swipeUp 선언. 액션 인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드를 의미함.
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up  // 위에서 선언한UISwipeGestureRecognizer 클래스 상수의 swipeUp의 direction 속성을 설정함. 여기서는 up
        // swipeUp.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeUp)  // 뷰 객체의 addGestureRecognizer메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록.
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        // swipeDown.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        // swipeLeft.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        // swipeRight.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondsToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    // 스와이프 제스처를 행했을 때 실행할 액션 메서드 구현.
    @objc func respondsToSwipeGesture(_ geusture: UIGestureRecognizer) {
        if let swipeGesture = geusture as? UISwipeGestureRecognizer  // 만약 제스처가 있다면
        {
            // 우선 전체 이미지 뷰를 검은색 화살표로 초기화.
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction
            {
                
            case UISwipeGestureRecognizer.Direction.up :
                imgViewUp.image = imgUp[1]
                
            case UISwipeGestureRecognizer.Direction.down :
                imgViewDown.image = imgDown[1]
                
            case UISwipeGestureRecognizer.Direction.left :
                imgViewLeft.image = imgLeft[1]
                
            case UISwipeGestureRecognizer.Direction.right :
                imgViewRight.image = imgRight[1]
            default :
                break
            }
            
        }
    }
    
    @objc func respondsToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction
            {
                
            case UISwipeGestureRecognizer.Direction.up :
                imgViewUp.image = imgUp[2]
                
            case UISwipeGestureRecognizer.Direction.down :
                imgViewDown.image = imgDown[2]
                
            case UISwipeGestureRecognizer.Direction.left :
                imgViewLeft.image = imgLeft[2]
                
            case UISwipeGestureRecognizer.Direction.right :
                imgViewRight.image = imgRight[2]
            default :
                break
            }
        }
    }

}

