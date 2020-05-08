//
//  ViewController.swift
//  PersonalQuizAnimal
//
//  Created by Carlos Camacho on 2020-05-06.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
}

