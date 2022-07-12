//
//  ViewController.swift
//  Navigation
//
//  Created by 한소희 on 2022/06/26.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    // 세그웨이를 이용하여 화면을 전환하기 위해 prepare 함수를 사용. prepare 함수는 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며, 데이터 전달을 위해 사용됨.
    override func prepare(for segue : UIStoryboardSegue, sender : Any?) {
        // 세그웨이의 도착 컨트롤러를 EditViewController 형태를 가지는 segue.destinationViewController로 선언. 그리고 세그웨이의 아이디에 따라 다르게 동작하도록 if문 형태로 작성.
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"
        {
            // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton"
        {
            // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        editViewController.textMessgae = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    func didMessgaeEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn
        {
        imgView.image = imgOn
        self.isOn = true
        }
        else
        {
            imgView.image = imgOff
            self.isOn = false
        }
    }


}

