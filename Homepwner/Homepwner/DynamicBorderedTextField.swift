//
//  HighlightBoarder.swift
//  Homepwner
//
//  Created by Anna Chan on 6/21/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class DynamicBorderedTextField: UITextField {

    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        borderStyle = .bezel
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        borderStyle = .roundedRect
        return true
    }
}
