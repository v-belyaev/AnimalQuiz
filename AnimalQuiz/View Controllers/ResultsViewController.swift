//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {

    // 1. Передать сюда массив с ответами ✅
    // 2. Определить наиболее часто встречающийся тип животного ✅
    // 3. Отобразить результаты на экране ✅
    // 4. Избавиться от кнопки возврата на предыдущий экран ✅

    // MARK: - IB Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    // MARK: - Properties
    var answers: [Answer] = []
    private var animalWinner: AnimalType!

    // MARK: - ViewController Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        animalWinner = getWinnerAmongAnimals(answers)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

}

// MARK: - Private
extension ResultsViewController {
    private func getWinnerAmongAnimals(_ answers: [Answer]) -> AnimalType {
        var animals: [AnimalType] = []
        
        answers.forEach {
            animals.append($0.type)
        }
        
        let animalWinner = animals.reduce([AnimalType:Int]()) {
            var counts = $0
            counts[$1] = ($0[$1] ?? 0) + 1
            return counts
        }.max {$0.1 < $1.1}!.0
        
        return animalWinner
    }
    
    private func setupUI() {
        titleLabel.text = "Вы — \(animalWinner.rawValue)!"
        subtitleLabel.text = animalWinner.definition
    }
}
