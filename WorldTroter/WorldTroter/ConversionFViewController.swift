//
//  ConversionFViewController.swift
//  WorldTroter
//
//  Created by yxhuang on 2018/1/6.
//  Copyright © 2018年 yxhuang. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate{
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenHeitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenHeitValue {
            return (value - 32) * (5 / 9)
        } else {
            return nil
        }
    }
    @IBAction func fahrenHeitFieldEdittingChanged(textField: UITextField){
//        if let text = textField.text, !text.isEmpty{
//            celsiusLabel.text = textField.text
//        } else {
//            celsiusLabel.text = "???"
//        }
     
        if let value = Double(textField.text!) {
            fahrenHeitValue = value
        } else {
            fahrenHeitValue = nil
        }
    }
    
    @IBAction func dimissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue {
//            celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.string(for: value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    // 数字格式化
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = NumberFormatter.Style.decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
//        print("Current text: \(textField.text)")
//        print("Replacement text: \(string)")
//
//        return true;
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
}
