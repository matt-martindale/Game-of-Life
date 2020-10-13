//
//  GridView.swift
//  Game of Life
//
//  Created by Matthew Martindale on 10/12/20.
//

import UIKit

class GridView: UIView {
    
    let numberPerRow = 25
    
    override func draw(_ rect: CGRect) {
        let width = rect.width / CGFloat(numberPerRow)
        
        for j in 0..<30 {
            for i in 0..<numberPerRow {
                let cellView = UIView()
                cellView.backgroundColor = .clear
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor(named: "atomicRed")?.cgColor
                addSubview(cellView)
            }
        }
    }

}
