//
//  ViewController.swift
//  Fill_In_Idiom
//
//  Created by Tai-Yun Chen on 2020/6/4.
//  Copyright © 2020 Jack Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 題數
    var questionCount = 0
    
    // 分數
    var score = 0
    
    // 正確答案
    var rightAnswer = ""
    
    // 題目與答案
    var questionData = [
                        Ques(image: "img_question_01.png", description: "牛刀小試", option: ["雞", "豬", "羊", "牛"], answer: "牛"),
                        Ques(image: "img_question_02.png", description: "騎虎難下", option: ["馬", "象", "虎", "鹿"], answer: "虎"),
                        Ques(image: "img_question_03.png", description: "守株待兔", option: ["鼠", "兔", "龜", "鴨"], answer: "兔"),
                        Ques(image: "img_question_04.png", description: "群龍無首", option: ["龍", "虎", "猴", "羊"], answer: "龍"),
                        Ques(image: "img_question_05.png", description: "虛與委蛇", option: ["熊", "蛇", "狐", "魚"], answer: "蛇"),
                        Ques(image: "img_question_06.png", description: "蛛絲馬跡", option: ["鳥", "狗", "馬", "蛇"], answer: "馬"),
                        Ques(image: "img_question_07.png", description: "偷雞摸狗", option: ["鶴", "鵝", "鴨", "雞"], answer: "雞"),
                        Ques(image: "img_question_08.png", description: "狗尾續貂", option: ["牛", "貓", "狗", "鼠"], answer: "狗"),
                        Ques(image: "img_question_09.png", description: "盲人摸象", option: ["狼", "象", "龍", "驢"], answer: "象"),
                        Ques(image: "img_question_10.png", description: "鳳毛麟角", option: ["鳳", "燕", "鶴", "雞"], answer: "鳳"),
    ]
    
    // 第幾題
    @IBOutlet weak var itemNumber: UILabel!
    
    // 分數
    @IBOutlet weak var scoreLabel: UILabel!
    
    // 題目圖片
    @IBOutlet weak var questionImage: UIImageView!
    
    // 答案區按鈕
    @IBOutlet var answerButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scoreLabel.text = "\(0)"
        itemNumber.text = "第 \(String(questionCount + 1)) 題"
        questionData.shuffle()
        startGame()
    }
    
    // 遊戲開始
    func startGame() {
        itemNumber.text = "第 \(questionCount + 1) 題"
        questionImage.image = UIImage(named: questionData[questionCount].image)
        rightAnswer = questionData[questionCount].answer
        questionData[questionCount].option.shuffle()
        
        for i in 0...3 {
            answerButton[i].setTitle(questionData[questionCount].option[i], for: .normal)
        }
        
    }
    
    // 點擊答案按鈕
    @IBAction func answerClick(_ sender: UIButton) {
        questionCount = questionCount + 1
        
        if sender.currentTitle == rightAnswer {
            score = score + 10
            scoreLabel.text = "\(score)"
        }
            
        if questionCount < 10 {
            startGame()
        }
            
        else {
            totalScore()
        }
    }
    
    // 點擊再玩一次按鈕
    @IBAction func restartClick(_ sender: UIButton) {
        restart()
    }
        
    // 再玩一次Function
    func restart() {
        score = 0
        questionCount = 0
        itemNumber.text = "\(questionCount + 1)"
        scoreLabel.text = "\(0)"
        questionData.shuffle()
        startGame()
    }
    
    // 彈跳視窗訊息Function
    func alertMessage(replaceTitle: String, replaceMessage: String, replaceBtnTxt: String) {
        let alertController = UIAlertController (
            title: replaceTitle, message: replaceMessage, preferredStyle: .alert)
        let alertBtn = UIAlertAction(
            title: replaceBtnTxt, style: .default, handler: {(_)in
                self.restart()
            })
        alertController.addAction(alertBtn)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 總分計算Function
    func totalScore() {
        if score >= 90 && score <= 100 {
            alertMessage(replaceTitle: "總分：\(score)", replaceMessage: "你就是成語達人啊！", replaceBtnTxt: "不玩了實在太簡單")
        }
        else if score >= 60 && score < 90 {
            alertMessage(replaceTitle: "總分：\(score)", replaceMessage: "看來你對中文有點生疏囉", replaceBtnTxt: "我要再玩一次")
        }
        else if score >= 30 && score < 60 {
            alertMessage(replaceTitle: "總分：\(score)", replaceMessage: "你的國文已被當掉了！", replaceBtnTxt: "我要再玩一次")
        }
        else {
            alertMessage(replaceTitle: "總分：\(score)", replaceMessage: "你讓小學老師心碎了！", replaceBtnTxt: "請多讀點書再來挑戰吧")
        }
    }
        
}
