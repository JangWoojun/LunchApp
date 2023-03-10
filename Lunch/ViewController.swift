//
//  ViewController.swift
//  Lunch
//
//  Created by Jangwoojun on 2022/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var choiceFoodButton: UIButton!
    
    var food : String?
    
    let noodle = [
        "토마토","짬뽕","쌀국수","까르보나라","짜장면","우동","냉면","칼국수","라멘"
    ]
    
    let rice = [
        "치킨마요덮밥","제육덮밥","커리","김치볶음밥","비빔밥","연어덮밥","돈부리","새우볶음밥","오므라이스"
    ]
    
    let soup = [
        "삼계탕","설렁탕","만두국","갈비탕","순대국","선지해장국","추어탕","육계장","콩나물국밥"
    ]
    
    let fastFood = [
        "햄버거","토스트","김밥","밥버거","떡볶이","샐러드","편의점 도시락","케이크","샌드위치"
    ]
    
    let special = [
        "도가니수육","칠리새우","오리고기","낚지볶음","아귀찜","월남쌈","스테이크","닭볶음탕","보쌈"
    ]
    
    let etc = [
        "피자","초밥","마파두부","고등어백반","곱창전골","탕수육","마라탕","찜닭","샤브샤브"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func foodTapped(_ sender: UIButton) {
        food = sender.currentTitle!
    }
    
    @IBAction func choiceFoodTapped(_ sender: UIButton) {
        if food != nil {
            switch food {
            case "면":
                mainLabel.text =  noodle.randomElement()
            case "밥":
                mainLabel.text = rice.randomElement()
            case "국물":
                mainLabel.text = soup.randomElement()
            case "간편식":
                mainLabel.text = fastFood.randomElement()
            case "특식":
                mainLabel.text = special.randomElement()
            case "기타":
                mainLabel.text = etc.randomElement()
            default:
                break
            }
            choiceFoodButton.isEnabled = false
        } else {
            showToast(message: "아직 음식 종류가 선택되지 않았어요!")
        }
        
        func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-100, width: 250, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
        
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        food = nil
        choiceFoodButton.isEnabled = true
        mainLabel.text = "오늘 뭐 먹지?"
    }
    
    
}

