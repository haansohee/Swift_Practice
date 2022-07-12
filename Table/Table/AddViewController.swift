//
//  AddViewController.swift
//  Table
//
//  Created by 한소희 on 2022/06/27.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)  // items에 필드의 텍스트 값을 추가함.
        itemsImageFile.append("clock.png")  // itemsImageFile에는 무조건 'clock.png' 파일을 추가함.
        tfAddItem.text = ""  // 텍스트 필드의 내용을 지움.
        _ = navigationController?.popViewController(animated: true)  // 루트 뷰 컨트롤러, 즉 테이블 뷰로 돌아감.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
