//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Anna Chan on 6/19/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    var isDayTime: Bool = true

    @IBOutlet var celsiusLabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    @IBOutlet var textField: UITextField!
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loadedits view.")
        
        updateCelsiusLabel()
        updateBackgroundForTimeOfDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isDayTime = !isDayTime
        updateBackgroundForTimeOfDay()
    }
    
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    func updateBackgroundForTimeOfDay() {
        if isDayTime {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.darkGray
        }
    }
    
}
