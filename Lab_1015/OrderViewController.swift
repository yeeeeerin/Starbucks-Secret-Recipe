//
//  OrderViewController.swift
//  Lab_1015
//
//  Created by 이예린 on 2017. 9. 30..
//  Copyright © 2017년 Yerin. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    typealias coffeeMenu = (name: String, image: String, price: Int)
    var coffee:coffeeMenu = ("" , "0", 0)
    
    @IBOutlet var coffeeName: UILabel! //커피이름
    @IBOutlet var price: UILabel! //커피가격
    @IBOutlet var saying: UILabel! //커피와 어울리는 한 마디
    @IBOutlet var coffeeImage: UIImageView! //커피이미지
    
    @IBOutlet var callingText: UITextView! //커피 주문서
    
    //커피이름과 가격 이미지 추가옵션은 전 scene에서 받아온다.
    var addCustomStr:String = "\n"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeName.text = coffee.name
        price.text = coffee.price.description
        coffeeImage.image = UIImage(named: coffee.image)
        
        //커피에 맞는 한마디와 주문서를 셋팅해준다.
        if(coffee.name == "고디바 프라푸치노"){
            saying.text = "달콤한 고디바초콜릿 한잔 어때요?"
            callingText.text = "벤티 5펌프 모카 2펌프 헤이즐넛 4펌프 프라푸치노 로스트 통 자바 칩 토핑 엑스트라 초코휩 엑스트라 모카드리즐 초콜릿크림 프라푸치노"
        }else if(coffee.name == "돼지바 프라푸치노"){
            saying.text = "달콤한 딸기의 향기에 빠져보시죠"
            callingText.text = "그란데 6펌프 딸기 소이 1위드 칩 위드 모카드리즐 딸기크림 프라푸치노"
        }else if(coffee.name == "바닐라크림 업그레이드"){
            saying.text = "바닐라 라때아니구 프라푸치노!"
            callingText.text = "싱글 그란데 위드드리즐 바닐라크림 프라푸치노"
        }else if(coffee.name == "슈렉 프라푸치노"){
            saying.text = "민트초코와는 또 다른 맛!!"
            callingText.text = "싱글 벤티 4스쿱 자바칩 반반 엑스트라에스프레소휩 엑스트라 모카드리즐 돔 드리드 그린티 프라푸치노"
        }else if(coffee.name == "캡틴 크런치 베리"){
            saying.text = "이거 한잔이면 점심 해결 가능!"
            callingText.text = "그란데 2펌프 헤이즐넛 소이 3위드 칩 위드 모카드리즐 돔 리드 딸기크림 푸라푸치노"
        }else if(coffee.name == "케이크 푸라푸치노"){
            saying.text = "포근한 케이크를 마셔보세요~"
            callingText.text = "그란데 2펌프 헤이즐넛 바닐라크림 프라푸치노"
        }else if(coffee.name == "트윅스"){
            saying.text = "트윅스랑 먹으면 환상궁합!"
            callingText.text = "그란데 1펌프 헤이즐넛 4펌프 카라멜 7스쿱 자바칩 반반 엑스트라 휩 엑스트라 드리즐 엑스트라 모카드리즐 카라멜 프라푸치노"
        }
        
        //추가된 옵션을 나타내는 string추가
        callingText.text.append("\n\n" + addCustomStr)
        
    }



}
