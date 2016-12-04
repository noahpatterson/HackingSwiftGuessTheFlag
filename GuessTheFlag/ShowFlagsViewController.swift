//
//  ShowFlagsViewController.swift
//  GuessTheFlag
//
//  Created by Noah Patterson on 12/2/16.
//  Copyright © 2016 noahpatterson. All rights reserved.
//

import UIKit
import GameplayKit

class ShowFlagsViewController: UIViewController {

    @IBOutlet weak var flagButton1: UIButton!
    @IBOutlet weak var flagButton2: UIButton!
    @IBOutlet weak var flagButton3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func flagSelected(_ sender: UIButton) {
        let flag = sender.tag
        var title: String
        if flag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Incorrect"
            score -= 1
        }
        scoreLabel.text = "Score: \(score)"
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    var countries     =  [String]()
    var score         = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
        flagButton1.layer.borderWidth = 1
        flagButton1.layer.borderColor = UIColor.lightGray.cgColor
        flagButton2.layer.borderWidth = 1
        flagButton2.layer.borderColor = UIColor.lightGray.cgColor
        flagButton3.layer.borderWidth = 1
        flagButton3.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func askQuestion(action: UIAlertAction! = nil) -> Void {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        flagButton1.setImage(UIImage(named: countries[0]), for: .normal)
        flagButton2.setImage(UIImage(named: countries[1]), for: .normal)
        flagButton3.setImage(UIImage(named: countries[2]), for: .normal)
    }


}

