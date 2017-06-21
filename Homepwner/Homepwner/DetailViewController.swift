//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Anna Chan on 6/21/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameField: DynamicBorderedTextField!
    @IBOutlet var serialNumberField: DynamicBorderedTextField!
    @IBOutlet var valueField: DynamicBorderedTextField!
    @IBOutlet var dateLabel: UILabel!
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item .valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDatepicker"?:
            let updateDateViewController = segue.destination as! UpdateDateViewController
            updateDateViewController.item = item
        default:
            preconditionFailure("Unexpected segues identifier.")
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
