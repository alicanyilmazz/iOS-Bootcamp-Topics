//
//  CalculatorViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var isFirstEnterance : Bool = true
    var _lock : Bool = true
    var lock : Bool = true

    @IBOutlet weak var lblGo: UIButton!
    //@IBOutlet var digitButtons: [UIButton]!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        lock = false
        let digit = String(sender.tag)
        let displayText = resultLabel.text ?? ""
        if isFirstEnterance {
            resultLabel.text = ""
            resultLabel.text = digit
            isFirstEnterance = false
        } else {
            resultLabel.text = displayText + digit
        }
        
    }
    

    @IBAction func processButtonTapped(_ sender: UIButton) {
        if sender.tag == 14 {
            if !_lock{
                MathOperations.secondNumber = Double(resultLabel.text!) ?? 0
                resultLabel.text = String(MathOperations.calculate(number1: MathOperations.firstNumber, number2: MathOperations.secondNumber))
                isFirstEnterance = true
            }
        }
        if sender.tag == 13 {
            if !lock {
                MathOperations.firstNumber = Double(resultLabel.text!) ?? 0
                resultLabel.text = "0"
                MathOperations.operationType = Process.divide
                lock = true
                _lock = false
            }
        }
        if sender.tag == 12 {
            if !lock {
                MathOperations.firstNumber = Double(resultLabel.text!) ?? 0
                resultLabel.text = "0"
                MathOperations.operationType = Process.multiply
                lock = true
                _lock = false
            }
          
        }
        if sender.tag == 11 {
            if !lock {
                MathOperations.firstNumber = Double(resultLabel.text!) ?? 0
                resultLabel.text = "0"
                MathOperations.operationType = Process.subtract
                lock = true
                _lock = false
            }
        }
        if sender.tag == 10 {
            if !lock {
                MathOperations.firstNumber = Double(resultLabel.text!) ?? 0
                resultLabel.text = "0"
                MathOperations.operationType = Process.add
                lock = true
                _lock = false
            }
        }
    }

    @IBAction func lblGoClicked(_ sender: UIButton) {
       performSegue(withIdentifier: "slider", sender: self)
    }
    

}

