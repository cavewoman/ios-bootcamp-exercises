//
//  QuizViewController.swift
//  Quiz
//
//  Created by Anna Chan on 6/19/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBAction func didPressShowQuestionButton(_ sender: UIButton) {
        currentQuestionIndex += 1

        if currentQuestionIndex >= questionsAndAnswers.count {
            currentQuestionIndex = 0
        }
        let (question, _) = questionsAndAnswers[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    @IBAction func didPressShowAnswerButton(_ sender: UIButton) {
        let (_, answer) = questionsAndAnswers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    let questionsAndAnswers: [(String, String)] = [
        ("What is this data structure?", "Tuple"),
        ("Is a hot dog a sandwich?", "It's a sandwich"),
        ("Do you want to fanta fanta?", "Yes"),
        ("Where's the beef?", "Under the pickle"),
        ("How many licks in a Tootsie roll tootsie pop?", "3"),
        ("How many animals does Joseph have on his farm?", "~100")
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let (question, _) = questionsAndAnswers[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
}
