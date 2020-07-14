//
//  QuestionsFactory.swift
//  07-MathsTraining
//
//  Created by Ricardo Sanchez on 7/13/20.
//  Copyright © 2020 Ricardo Sanchez. All rights reserved.
//

import Foundation



class QuestionFactory {
    
    private var questions = [Question]()
    public private(set) var score = 0
    public private(set) var pointsPerQuestion = 100
    
    
    
    init() {
        addNewQuestion()
    }
    func restartData() {
        self.score = 0
        self.questions.removeAll()
        addNewQuestion()
    }
    
    func addNewQuestion() {
        questions.insert(createQuestion(), at: 0)
    }
    
   func getQuestionAt(position: Int) -> Question? {
        if(position<0 || position >= questions.count){
            return nil
        }
        return self.questions[position]        
    }
    
    func updateQuestion(at index: Int , with answer: Int) {
        
        questions[index].userAnswer = answer
        
    }
    
    func compareAnswers(at index: Int, with answer1: Int, with answer2: Int) {
        if questions[index].answer == answer1 {
            updateQuestion(at: index, with: answer1)
        }else {
            updateQuestion(at: index, with: answer2)
        }
    }
    
    func validateQuestion(at index : Int) {
        if self.questions[index].userAnswer == self.questions[index].answer {
            self.score += pointsPerQuestion
        }
    }
    
    func getNumberOfQuestion() -> Int {
        return questions.count
    }
    
    func createQuestion() -> Question {
        var question = ""
        var correctAnswer = 0
        
        while true {
            let firstNumber = Int.random(in: 0...9)
            let secondNumber = Int.random(in: 0...9)
            
            if Bool.random(){
                //generamos una operacion de suma
                let result = firstNumber + secondNumber
                if result < 10 {
                    question = "\(firstNumber) + \(secondNumber)"
                    correctAnswer = firstNumber + secondNumber
                    break
                }
            } else {
                //Generamos una operacion de resta
                let result = firstNumber - secondNumber
                if result >= 0 {
                    question = "\(firstNumber) - \(secondNumber)"
                    correctAnswer = firstNumber - secondNumber
                    break
                }
            }
        }
        return Question(text: question, answer: correctAnswer, userAnswer: nil)
    }
    
    
}
