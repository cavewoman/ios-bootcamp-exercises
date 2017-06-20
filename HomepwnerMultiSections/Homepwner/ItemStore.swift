//
//  ItemStore.swift
//  Homepwner
//
//  Created by Anna Chan on 6/20/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    var expensiveItems = [Item]()
    var cheapItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        if newItem.valueInDollars > 50 { expensiveItems.append(newItem) }
        else { cheapItems.append(newItem) }
        return newItem
    }
}
