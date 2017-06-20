//
//  QuizViewController.swift
//  Quiz
//
//  Created by Anna Chan on 6/19/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    @IBAction func didPressShowQuestionButton(_ sender: UIButton) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex >= questionsAndAnswers.count {
            currentQuestionIndex = 0
        }
        let (question, _) = questionsAndAnswers[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
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
        ("How many licks in a Tootsie roll tootsie pop? How many licks in a Tootsie roll tootsie pop? How many licks in a Tootsie roll tootsie pop? How many licks in a Tootsie roll tootsie pop?", "3"),
        ("How many animals does Joseph have on his farm?", "~100")
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let (question, _) = questionsAndAnswers[currentQuestionIndex]
        currentQuestionLabel.text = question
        answerLabel.text = "???"
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
        })
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
}
