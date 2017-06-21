//
//  UpdateDateViewController.swift
//  Homepwner
//
//  Created by Anna Chan on 6/21/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class UpdateDateViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    var item: Item!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        datePicker.date = item.dateCreated
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        item.dateCreated = datePicker.date
    }

}
