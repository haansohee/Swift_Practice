//
//  ViewController.swift
//  Tab
//
//  Created by 한소희 on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1  // 이미지 뷰 탭으로 이동
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2  // 데이터 피커 뷰 탭으로 이동
    }
    
}

