//
//  DrawView.swift
//  TouchTracker
//
//  Created by Anna Chan on 6/22/17.
//  Copyright © 2017 Anna Sherman. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()
    var selectedLineIndex: Int? {
        didSet {
            if selectedLineIndex == nil {
                let menu = UIMenuController.shared
                menu.setMenuVisible(false, animated: true)
            }
        }
    }
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.doubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.tap(_:)))
        tapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(tapRecognizer)
    }
    
    func doubleTap(_ gestureRecognizer: UIGestureRecognizer) {
        print("Recognized a double tap")
        selectedLineIndex = nil
        currentLines.removeAll()
        finishedLines.removeAll()
        setNeedsDisplay()
    }
    
    func tap(_ gestureRecognizer: UIGestureRecognizer) {
        print("Recognized tap")
        
        let point = gestureRecognizer.location(in: self)
        selectedLineIndex = indexOfLine(at: point)
        
        let menu = UIMenuController.shared
        
        if selectedLineIndex != nil {
            becomeFirstResponder()
            let deleteItem = UIMenuItem(title: "Delete", action: #selector(DrawView.deleteLine(_:)))
            menu.menuItems = [deleteItem]
            
            let targetRect = CGRect(x: point.x, y: point.y, width: 2, height: 2)
            menu.setTargetRect(targetRect, in: self)
            menu.setMenuVisible(true, animated: true)
        } else {
            menu.setMenuVisible(false, animated: true)
        }
        
        setNeedsDisplay()
        
    }
    
    
    func stroke(_ line: Line) {
        let path = UIBezierPath()
        path.lineWidth = lineThickness
        path.lineCapStyle = .round
        
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    func deleteLine(_ sender: UIMenuController) {
        if let index = selectedLineIndex {
            finishedLines.remove(at: index)
            selectedLineIndex = nil
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for line in finishedLines {
            getQuadColor(quad: line.quad).setStroke()
            stroke(line)
        }
        
        currentLineColor.setStroke()
        for(_, line) in currentLines {
            stroke(line)
        }
        
        if let index = selectedLineIndex {
            UIColor.purple.setStroke()
            let selectedLine = finishedLines[index]
            stroke(selectedLine)
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func indexOfLine(at point: CGPoint) -> Int? {
        for (index, line) in finishedLines.enumerated() {
            let begin = line.begin
            let end = line.end
            
            for t in stride(from: CGFloat(0), to: 1.0, by: 0.05) {
                let x = begin.x + ((end.x - begin.x) * t)
                let y = begin.y + ((end.y - begin.y) * t)
                if hypot(x - point.x, y - point.y) < 20.0 {
                    return index
                }
            }
        }
        return nil
    }
    
    func getQuadColor(quad: Int) -> UIColor {
        switch quad {
        case 1:
            return UIColor.green
        case 2:
            return UIColor.yellow
        case 3:
            return UIColor.blue
        default:
            return UIColor.red
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        for touch in touches {
            let location = touch.location(in: self)
            let newLine = Line(begin: location, end: location, quad: getQuad(beginP: location, endP: location))
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.location(in: self)
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.location(in: self)
                line.quad = getQuad(beginP: line.begin, endP: line.end)
                finishedLines.append(line)
                currentLines.removeValue(forKey: key)
            }
        }
        
        setNeedsDisplay()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        currentLines.removeAll()
        setNeedsDisplay()
    }
    
    func getQuad(beginP: CGPoint, endP: CGPoint) -> Int {
        let (x, y) = (beginP.x - endP.x, beginP.y - endP.y)
        if x >= 0 && y >= 0 {
            return 1
        } else if x < 0 && y > 0 {
            return 2
        } else if x < 0 && y < 0 {
            return 3
        } else {
            return 4
        }
    }
}
