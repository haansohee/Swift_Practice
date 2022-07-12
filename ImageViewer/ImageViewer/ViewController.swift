//
//  ViewController.swift
//  ImageViewer
//
//  Created by 한소희 on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {
    var maxImage = 3;
    var numImage = 1;
    
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var btnNext: UIButton!
    @IBOutlet var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = UIImage(named: "1.png")
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBack(_ sender: UIButton) {
        numImage -= 1
        if (numImage < 1) {
            numImage = maxImage
        }
        
        let imgName = String(numImage) + ".png"
        ImageView.image = UIImage(named: imgName)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if (numImage > maxImage) {
            numImage = 1
        }
        
        let imgName = String(numImage) + ".png"
        ImageView.image = UIImage(named: imgName)
        
        
    }
    
}

