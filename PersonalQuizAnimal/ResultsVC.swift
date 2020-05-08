//
//  ResultsVC.swift
//  PersonalQuizAnimal
//
//  Created by Carlos Camacho on 2020-05-08.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    var responses: [Answer]!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResults()
        // Do any additional setup after loading the view.
    }
    
    func calculateResults(){
        var frequency: [AnimalType: Int] = [:]
        let responseType = responses.map{$0.type}
        
        for response in responseType{
            frequency[response] = (frequency[response] ?? 0) + 1
        }
        let frequenAnswer = frequency.sorted {(pair1, pair2) ->Bool in return pair1.value > pair2.value}
        let mostCommon = frequency.sorted{ $0.1 > $1.1}.first!.key
        resultLabel.text = "You are a \(mostCommon.rawValue)"
        descriptionLabel.text = mostCommon.definition
        
    }

    

}
