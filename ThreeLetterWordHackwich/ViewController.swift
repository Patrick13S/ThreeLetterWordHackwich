//
//  ViewController.swift
//  ThreeLetterWordHackwich
//
//  Created by Patrick Stroyan on 4/4/22.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var currentLetterLabel: UILabel!
    
    @IBOutlet var wordLabels: [UILabel]!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    var letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var counter = 0
    var currentLetter = "A"
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    
    @IBAction func whenTapped(_ sender: Any)
    {
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
        
        let selectedPoint = ((sender as! AnyObject).location(in: stackView))
        
    
        for label in wordLabels
        {
        if label.frame.contains(selectedPoint)
            {
        label.text = "\(currentLetter)"
        }
        }
        
        counter += 1
        if counter == 26 {
        counter = resetCounter()
        }
        func getAndSetCurrentLetter() {
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
        }
        getAndSetCurrentLetter()
        
    }
    func resetCounter () -> Int {
    let alert = UIAlertController(title: "Resetting Counter", message: nil, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
    for label in self.wordLabels {
    label.text = "?"
    }
    }
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
    return 0
    }
}


