//
//  CustomViewController.swift
//  Lab_1015
//
//  Created by 이예린 on 2017. 9. 30..
//  Copyright © 2017년 Yerin. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    
    @IBOutlet var userLabel: UILabel!
    var userName:String = ""
    var coffeeNameStr:String = ""
    var coffeeImageStr:String = ""
    var priceStr:Int = 0
    
    @IBOutlet var shotlabel: UILabel!
    @IBOutlet var syruplabel: UILabel!
    @IBOutlet var javachiplabel: UILabel!
    @IBOutlet var drizzlelabel: UILabel!
    @IBOutlet var whippinglabel: UILabel!
    
    
    
    @IBOutlet var drizzleSeg: UISegmentedControl!
    @IBOutlet var whippingSeg: UISegmentedControl!
    
    //addCustom[0] = shot
    //addCustom[1] = syrup
    //addCustom[2] = javachip
    var addCustom = [ 0 , 0 , 0 ]
    var addCustomStr:String = "+"    //추가 커스텀 나타내는 변수
    
    @IBAction func ctrlstepper(_ sender: UIStepper) {
        
        //얼마나 추가가 되는지 측정
        //샷은 1샷당 500원씩 나머지는 1이상일 경우 500원씩 가격이 올라가며
        //기본 음료에 옵션이 추가되어있으면 가격이 올라가지 않는다.
        if sender.restorationIdentifier=="shot"{
            shotlabel.text = String(Int(sender.value))
            priceStr = priceStr + 500
            addCustom[0] = addCustom[0] + 1
        }else if sender.restorationIdentifier=="syrup"{
            syruplabel.text = String(Int(sender.value))
            addCustom[1] = addCustom[1] + 1
        }else if sender.restorationIdentifier=="javachip"{
            javachiplabel.text = String(Int(sender.value))
            addCustom[2] = addCustom[2] + 1
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = userName+"님 "+coffeeNameStr + " 음료를\n 커스텀 해주세요."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "customorderSeg"){
            let destVC = segue.destination as! OrderViewController
            
            //기본 셋팅 외 추가되는 옵션이 있을경우 500원씩 가격이 올라간다.
            if(coffeeNameStr == "바닐라크림 업그레이드" ){
                if Int(javachiplabel.text!)!>0{
                    priceStr = priceStr + 500
                }

            }else if(coffeeNameStr == "케이크 푸라푸치노"){
                if (Int(javachiplabel.text!)! > 0) && (drizzleSeg.selectedSegmentIndex) > 0{
                    priceStr = priceStr + 500
                }
            }
            
            //원래 있는 옵션을 선택 안할 경우 500원씩 차감한다.
            if whippingSeg.titleForSegment(at: whippingSeg.selectedSegmentIndex) == "없음" {
                priceStr = priceStr - 500
            }
            if drizzleSeg.titleForSegment(at: drizzleSeg.selectedSegmentIndex) == "없음" &&
                coffeeImageStr != "캡틴 크런치 베리" && coffeeImageStr != "케이크 프라푸치노" {
                
            }
            
            //추가되는 옵션이 있을경우 addCustomStr 변수에 저장하고 그 값을 OrderViewController에 넘겨준다.
            if addCustom[0]>0{ addCustomStr.append("에스프레소샷"+addCustom[0].description) }
            if addCustom[1]>0{ addCustomStr.append(" 시럽"+addCustom[1].description+"펌프") }
            if addCustom[2]>0{ addCustomStr.append(" 자바칩"+addCustom[2].description+"스쿱") }
            addCustomStr.append(" 드리즐"+drizzleSeg.titleForSegment(at: drizzleSeg.selectedSegmentIndex)!)
            addCustomStr.append(" 휘핑"+whippingSeg.titleForSegment(at: whippingSeg.selectedSegmentIndex)!)
            
            
            destVC.coffeeNameStr = coffeeNameStr
            destVC.priceStr = priceStr
            destVC.coffeeImageStr = coffeeImageStr
            destVC.addCustomStr = addCustomStr
            
        }
        
        
    }


}
