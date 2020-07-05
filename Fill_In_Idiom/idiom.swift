//
//  idiom.swift
//  Fill_In_Idiom
//
//  Created by Tai-Yun Chen on 2020/6/4.
//  Copyright © 2020 Jack Chen. All rights reserved.
//

import Foundation

//class Question {
//    var description = String()
//    var answer = String()
//}

struct Ques {
    // 問題圖片
    var image: String
    
    // 問題文字
    var description: String
    
    // 答案選項
    var option: [String]
    
    // 正確答案
    var answer: String
}
