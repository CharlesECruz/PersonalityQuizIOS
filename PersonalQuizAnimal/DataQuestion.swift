//
//  DataQuestion.swift
//  PersonalQuizAnimal
//
//  Created by Carlos Camacho on 2020-05-06.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import Foundation

struct Question{
    var text: String
    var type: ResponseType
    var answers:[Answer]
}

enum ResponseType{
    case single,multiple,ranged
}
struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case fox = "🦊",dog = "🐶",rabbit = "🐇",cat = "🐱"
    var definition: String {
        switch self {
        case .fox:
            return "You are a sneaky person"
        case .dog:
            return "You are a loyal person"
        case .rabbit:
            return "You are a cute person"
        case .cat:
            return "You are a great person"
        }
    }
}
