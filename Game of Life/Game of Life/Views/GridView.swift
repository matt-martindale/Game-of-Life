//
//  GridView.swift
//  Game of Life
//
//  Created by Matthew Martindale on 10/12/20.
//

import UIKit

class GridView: UIView {
    
    let numberPerRow = 25
    var cells = [String : CellView]()
    
    let clearGrid = Notification.Name(rawValue: clearGridKey)
    
    override func draw(_ rect: CGRect) {
        
        createObserver()
        let width = rect.width / CGFloat(numberPerRow)
        
        for j in 0..<30 {
            for i in 0..<numberPerRow {
                let cellView = CellView(state: .alive, width: width, i: i, j: j)
                
                if cellView.state == .alive {
                    cellView.backgroundColor = UIColor(named: "atomicRed")
                } else {
                    cellView.backgroundColor = UIColor.clear
                }
                
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor(named: "atomicRed")?.cgColor
                addSubview(cellView)
                
                let key = "\(j)|\(i)"
                cells[key] = cellView
            }
        }
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGesture)))
        
    }
    
    @objc private func tapGesture(gesture: UITapGestureRecognizer) {
        guard gesture.view != nil else { return }
        
        if gesture.state == .ended {
            let location = gesture.location(in: self)
            let width = self.frame.width / CGFloat(numberPerRow)
            
            let i = Int(location.x / width)
            let j = Int(location.y / width)
            print(i, j)
            
            let key = "\(j)|\(i)"
            let cellView = cells[key]
            
            cellView?.toggleCellState(for: cellView)
        }
    }
    
    @objc private func panGesture(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self)
        
        let width = self.frame.width / CGFloat(numberPerRow)
        
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print(i, j)
        
        let key = "\(j)|\(i)"
        let cellView = cells[key]
        
        cellView?.state = .alive
        cellView?.backgroundColor = UIColor(named: "atomicRed")
    }
    
    // MARK: - Helper Functions
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(clearGrid(notification:)), name: clearGrid, object: nil)
    }
    
    @objc func clearGrid(notification: NSNotification) {
        for (_, value) in cells {
//            print(value.state)
            value.state = .dead
            value.backgroundColor = .clear
        }
        self.setNeedsDisplay()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
