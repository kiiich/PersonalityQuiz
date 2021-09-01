//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        updateUI()
    }
}

extension ResultViewController {
    
    private func updateUI() {
        
        var animals: [Animal: Int] = [:]
        
        answers.forEach { answer in
            if let currentAnimal = animals[answer.animal] {
                animals[answer.animal] = currentAnimal + 1
            } else {
                animals[answer.animal] = 1
            }
        }
        
        let maxAnimal = animals.max { $0.value < $1.value }
        
        guard let currentAnimal = maxAnimal?.key else {
            return
        }
        
        header.text = "Вы - \(currentAnimal.rawValue)"
        animalDescription.text = currentAnimal.definition
        
    }
    
}
