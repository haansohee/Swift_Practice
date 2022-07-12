//
//  EditViewController.swift
//  Navigation
//
//  Created by 한소희 on 2022/06/26.
//

import UIKit

protocol EditDelegate {
    func didMessgaeEditDone(_ controller : EditViewController, message : String)
    func didImageOnOffDone(_ controller : EditViewController, isOn : Bool)
}

class EditViewController: UIViewController {
    // 레이블의 텍스트를 직접 제어할 수 없으므로 문자열 변수 textWayValue 생성.
    // txtMessage도 마찬가지로 '수정화면'에서 직접 텍스트 필드의 텍스트를 제어할 수 없으므로 변수 textMessage를 문자열로 만듦.
    var textWayValue : String = ""
    var textMessgae : String = ""
    var delegate : EditDelegate?
    var isOn = false  // 수정화면에서 직접 스위치를 제어할 수 없으므로 변수 isOn 생성
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 그리고 textWayValue 값을 레이블의 텍스트롤 대입하여 레이블에 출력되게 함.
        lblWay.text = textWayValue
        txMessage.text = textMessgae
        swIsOn.isOn = isOn  // viewDidLoad 함수에서 변수 isOn 값을 스위치의 On에 대입하여 스위치 값에 출력되게 함.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil
        {
            delegate?.didMessgaeEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn
        {
            isOn = true
        }
        else
        {
            isOn = false
        }
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
