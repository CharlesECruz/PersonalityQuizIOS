//
//  Questions.swift
//  PersonalityQuiz
//
//  Created by Carlos Camacho on 2020-05-07.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class Questions: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    
    @IBOutlet weak var multipleSwitch1: UISwitch!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleSwitch3: UISwitch!
    @IBOutlet weak var multipleSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    //Variables
    
    var questionIndex = 0
    var chosenAnswers: [Answer] = []
    
    var questions: [question] = [
        question(text:"Which food do you like more?",type: .single,answers:[
        Answer(text:"Bambu",type: .panda),
        Answer(text:"Steak",type: .dog),
        Answer(text: "Fish", type: .fox),
        Answer(text: "Corn", type: .chicken)
            
    ]),
        question(text:"Which activity do you like more?",type: .multiple,answers:[
            Answer(text:"Sleep",type: .panda),
            Answer(text:"Run",type: .dog),
            Answer(text: "Hunt", type: .fox),
            Answer(text: "Fish", type: .fox),
            Answer(text: "Jump", type: .chicken)
    ]),
        question(text:"How much do you enjoy fly?",type: .ranged,answers:[
            Answer(text:"I dislike them",type: .panda),
            Answer(text:"I get a little nervous",type: .dog),
            Answer(text: "I barely notice them", type: .fox),
            Answer(text: "I love them", type: .chicken)
            ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        navigationItem.title = "Question #\(questionIndex + 1)"
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        let currentAnswer = currentQuestion.answers
        let totalprogress = Float(questionIndex)/Float(questions.count)
        progressView.setProgress(totalprogress, animated: true)
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswer)
        case .multiple:
            updateMultipleStack(using: currentAnswer)
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
    }
    func updateSingleStack(using answer: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answer[0].text, for: .normal)
        singleButton2.setTitle(answer[1].text, for: .normal)
        singleButton3.setTitle(answer[2].text, for: .normal)
        singleButton4.setTitle(answer[3].text, for: .normal)
    }
    func updateMultipleStack(using answer: [Answer]){
        multipleStackView.isHidden = false
        multiLabel1.text = answer[0].text
        multiLabel2.text = answer[1].text
        multiLabel3.text = answer[2].text
        multiLabel4.text = answer[3].text
    }
    func updateRangedStack(using answer: [Answer]){
        rangedStackView.isHidden = false
        rangedLabel1.text = answer.first?.text
        rangedLabel2.text = answer.last?.text
    }
    func nextQuestion(){
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            chosenAnswers.append(currentAnswers[0])
        case singleButton2:
            chosenAnswers.append(currentAnswers[1])
        case singleButton3:
            chosenAnswers.append(currentAnswers[2])
        case singleButton4:
            chosenAnswers.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        if multipleSwitch1.isOn{
            chosenAnswers.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn{
            chosenAnswers.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn{
            chosenAnswers.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn{
            chosenAnswers.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count-1)))
        chosenAnswers.append(currentAnswers[index])
        nextQuestion()
    }
    
}
