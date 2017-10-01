//
//  PickerViewController.swift
//  Lab_1015
//
//  Created by 이예린 on 2017. 9. 28..
//  Copyright © 2017년 Yerin. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var introLabel: UILabel!
    var userName: String = ""
    
    @IBOutlet var pickCoffee: UIPickerView!
    @IBOutlet var coffeeImage: UIImageView!
    @IBOutlet var price: UILabel!
    
    //같은커피의 종류와 이미지이름 가격은 같은 인덱스 번호를 가지고 있다
    var type = ["고디바 프라푸치노","돼지바 프라푸치노","바닐라크림 업그레이드",
                "슈렉 프라푸치노","캡틴 크런치 베리","케이크 푸라푸치노","트윅스"]

    var typeName=["godibar.jpg","pigbar.jpg","vanilla_upgrade.jpg",
                  "Shrek.jpg","captain_crunch.jpg","cake.jpg","twix.jpg"]
    
    var typePrice=[8300,7800,6000,8700,6200,6000,7400]
    
    var pickedCoffeeNum:Int = 0 //선택한 커피의 index값을 받는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickCoffee.dataSource = self
        pickCoffee.delegate = self
        
        introLabel.text = "안녕하세요! " + userName + "님!!"
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "customSeg"){
            //커스텀하기 버튼을 눌렀을 때
            //커피의 이름, 유저이름, 가격, 커피이미지이름을 넘겨준다.
            let destVC = segue.destination as! CustomViewController
            
            destVC.coffeeNameStr = type[pickedCoffeeNum]
            destVC.userName = userName
            destVC.priceStr = typePrice[pickedCoffeeNum]
            destVC.coffeeImageStr = typeName[pickedCoffeeNum]
            
        }else if(segue.identifier == "orderSeg"){
            //주문하기 버튼을 눌렀을 때
            //커피의 이름, 가격, 커피이미지이름을 넘겨준다.
            let destVC = segue.destination as! OrderViewController
            
            destVC.coffeeNameStr = type[pickedCoffeeNum]
            destVC.priceStr = typePrice[pickedCoffeeNum]
            destVC.coffeeImageStr = typeName[pickedCoffeeNum]
            
        }
        
        
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        return NSAttributedString(string: type[row], attributes: [NSForegroundColorAttributeName:UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return type[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedCoffeeNum = row //선택한 음료의 인덱스번호 저장
        
        let image = UIImage(named: typeName[row]) //선택한 음료와 맞는 이미지 셋팅
        coffeeImage.image = image
        
        price.text = typePrice[row].description + "won" //선택한 음료와 맞는 가격 셋팅
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }


}
