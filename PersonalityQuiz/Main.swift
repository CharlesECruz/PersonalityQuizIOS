//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Carlos Camacho on 2020-05-07.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class Main: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startQuiz(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
}

