//
//  DataQuestions.swift
//  PersonalityQuiz
//
//  Created by Carlos Camacho on 2020-05-07.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import Foundation

struct question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType{
    case single,multiple,ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", panda = "🐼", fox = "🦊", chicken = "🐥"
    
    var definition:String{
        switch self {
        case .dog:
            return "You are a leal person"
        case .panda:
            return "You are a lazy person"
        case .fox:
            return "You are a sneaky person"
        case .chicken:
            return "You are so cute"
        }
    }
}
