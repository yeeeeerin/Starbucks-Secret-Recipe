//
//  ViewController.swift
//  Lab_1015
//
//  Created by 이예린 on 2017. 9. 27..
//  Copyright © 2017년 Yerin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var userName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pickerview"){
            
            let destVC = segue.destination as! PickerViewController
            //유저 이름을 PickerViewController에 전달한다.
            destVC.userName = userName.text!
        }


    }




}

