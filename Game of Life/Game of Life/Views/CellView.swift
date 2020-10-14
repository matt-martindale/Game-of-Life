//
//  CellView.swift
//  Game of Life
//
//  Created by Matthew Martindale on 10/13/20.
//

import UIKit

class CellView: UIView {
    
    enum State {
        case alive
        case dead
    }
    
    var state: State
    var width: CGFloat
    var i: Int
    var j: Int
    
    init(state: State, width: CGFloat, i: Int, j: Int) {
        self.state = .dead
        self.width = width
        self.i = i
        self.j = j
        super.init(frame: CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleCellState(for cellView: CellView?) {
        if cellView?.state == .alive {
            cellView?.state = .dead
        } else {
            cellView?.state = .alive
        }
        
        if cellView?.state == .alive {
            cellView?.backgroundColor = UIColor(named: "atomicRed")
        } else {
            cellView?.backgroundColor = UIColor.clear
        }
    }
    
}
