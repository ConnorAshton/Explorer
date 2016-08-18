//
//  ViewController.swift
//  Explorer
//
//  Created by Connor Ashton on 11/08/2016.
//  Copyright © 2016 Connor Ashton. All rights reserved.
//

import UIKit

class ConversionVC: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        print("ConversionVC Loaded")
    }

    @IBOutlet var fahrenheitTextField: UITextField!
    @IBOutlet var celsiusLabel: UILabel!
   
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = ""
        }
        
    }
    
    @IBAction func dismissKeyboard(){
        fahrenheitTextField.resignFirstResponder()
    }
    
    
    
    
    @IBAction func fahrenheitTextFieldUserEnteredValue(text: UITextField!) {
        // Grab the text, if let statement, turn it into a number
        
        if let text = fahrenheitTextField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
        
    }
    
    let numberFormatter: NSNumberFormatter =
    {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        
        return nf
        
    } ()
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimal = textField.text?.rangeOfString(".")
        let replacementTextHasDecimal = string.rangeOfString(".")
        
        let prohibitedCharacters = NSCharacterSet.letterCharacterSet()
        let replacementTextHasLetter = string.rangeOfCharacterFromSet(prohibitedCharacters)
        
        
        if existingTextHasDecimal != nil && replacementTextHasDecimal != nil {
            return false
        }
        
        if replacementTextHasLetter != nil {
        return false
       }
        return true
    }

    
    
}



