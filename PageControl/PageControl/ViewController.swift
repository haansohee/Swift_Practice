//
//  ViewController.swift
//  PageControl
//
//  Created by 한소희 on 2022/06/24.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png",]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    // 뷰가 보일 때 자동으로 호출되는 함수는 ViewDidLoad() 함수. 이 함수 안에 뷰를 보여 줄 때 실행하고 싶은 코드를 추가하면 됨.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count  // numberOfPages : 페이지 컨트롤의 전체 페이지 수를 의미
        pageControl.currentPage = 0  // currentPage : 현재 페이지를 의미
        
        pageControl.pageIndicatorTintColor = UIColor.green
        // pageIndicatorTintColor : 페이지 컨트롤의 페이지를 표시하는 부분의 색상을 의미. UIColor.green 을 입력하면 전체 동그라미 부분이 초록색으로 표시됨.
        pageControl.currentPageIndicatorTintColor = UIColor.red
        // currentPageIndicatorTintColor : 페이지 컨트롤의 현재 페이지를 표시하는 색상을 의미. UIColor.red 를 입력하면 현재 페이지가 빨간색으로 표시됨.ㅜ
        imgView.image = UIImage(named: images[0])
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        // images[pageControl.currentPage : 페이지 컨트롤의 현재 페이지를 가지고 옴.
        // named : 현재 페이지에 해당하는 이미지 파일의 이름을 images 배열에서 가지고 옴.
        // UIImage : UIImage 타입의 이미지를 만듦.  imgView.image : 만든 이미지를 이미지 뷰에 할당함.
    }
    
}

