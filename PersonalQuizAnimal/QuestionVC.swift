//
//  QuestionVC.swift
//  PersonalQuizAnimal
//
//  Created by Carlos Camacho on 2020-05-06.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    
    
    
    //Single View
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1 : UIButton!
    @IBOutlet weak var singleButton2 : UIButton!
    @IBOutlet weak var singleButton3 : UIButton!
    @IBOutlet weak var singleButton4 : UIButton!
    
    
    
    
    
    
    // multiple View
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!

    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    // Ranged View
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    // ranged view
    @IBOutlet weak var rangedStackView: UIStackView!
    
    //Variables
    
    var questionIndex = 0
    var UserAnswers: [Answer] = []
    
    var questions:[Question] = [
        Question(text:"Which food do you like most?",type: .single,answers:[
            Answer(text:"Berries",type: .fox),
            Answer(text:"Steak",type: .dog),
            Answer(text:"Carrots",type: .rabbit),
            Answer(text:"Fish",type: .cat)
            ]),
        Question(text:"Which activities do you enjoy?",type: .multiple,answers:[
            Answer(text:"Camping",type: .fox),
            Answer(text:"Running",type: .dog),
            Answer(text:"Eating",type: .rabbit),
            Answer(text:"Sleeping",type: .cat)
            ]),
        Question(text:"Do you enjoy travel?",type: .ranged,answers:[
            Answer(text:"I dislike",type: .rabbit),
            Answer(text:"I get a little nervous",type: .dog),
            Answer(text:"I barely notice",type: .cat),
            Answer(text:"I love it",type: .fox)
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
        navigationItem.title = "Qustion #\(questionIndex+1)"
        let currentQuestion = questions[questionIndex]
        QuestionLabel.text = currentQuestion.text
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswer)
        case .multiple:
            updateMultipleStack(using: currentAnswer)
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
    }
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "resultsUser", sender: nil)
        }
    }

    
    
    //single Answer action
    @IBAction func answerSinglePressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            UserAnswers.append(currentAnswer[0])
        case singleButton2:
            UserAnswers.append(currentAnswer[1])
        case singleButton3:
            UserAnswers.append(currentAnswer[2])
        case singleButton4:
            UserAnswers.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    //Multiple Answer action
    
    
    @IBAction func mutpleAnswerPressed() {
        let currentAnswer = questions[questionIndex].answers
        if multiSwitch1.isOn{
            UserAnswers.append(currentAnswer[0])
        }
        if multiSwitch2.isOn{
            UserAnswers.append(currentAnswer[1])
        }
        if multiSwitch3.isOn{
            UserAnswers.append(currentAnswer[2])
        }
        if multiSwitch4.isOn{
            UserAnswers.append(currentAnswer[3])
        }
        nextQuestion()
    }
    
    // Ranged Answer Action
    
    @IBAction func rangedAnswerPressed() {
        if questionIndex < questions.count{
            let currentAnswer = questions[questionIndex].answers
            let index = Int(round(rangedSlider.value * Float(currentAnswer.count-1)))
            UserAnswers.append(currentAnswer[index])
        }
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsUser"{
            let resultsViewController = segue.destination as! ResultsVC
            resultsViewController.responses = UserAnswers
        }
        
    }
}
