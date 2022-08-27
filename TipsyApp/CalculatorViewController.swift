//
//  ViewController.swift
//  TipsyApp
//
//  Created by YILDIRIM on 26.08.2022.
//

import UIKit

class CalculatorViewController : UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPerson = 2
    var bilTotal = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Textfield editing
        billTextField.endEditing(true)
        
        //Deselect all buttons
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        
        //Selected Button
        sender.isSelected = true
        
        //Choose tip
        let tipBtnTitle = (sender.titleLabel?.text ?? "00") as String
        let tipBtnTitleMinusPercent = String(tipBtnTitle.dropLast())
        let tipBtnTitleAsNumber = Double(tipBtnTitleMinusPercent)!
        
        //Calculate Tip
        tip = tipBtnTitleAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Get the stepper value using sender.value  round it down to a whole number then set it as the text in the splitNumberLabel
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPerson = Int(sender.value)
    }
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
            
        let bill = billTextField.text!
        if bill != "" {
            bilTotal = Double(bill)!
            
            //Multiply the bill with tip
            
            let result = bilTotal * (1 + tip) / Double(numberOfPerson)
            
            let resultToDecimal = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            
        }
    }
}

