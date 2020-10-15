//
//  Cell.swift
//  Game of Life
//
//  Created by Matthew Martindale on 10/13/20.
//
import Foundation

class Cell {
  
  let x: Int, let y: Int
  var state: State
  
  enum State {
    case alive
    case dead
  }
  
  init(x: Int, y: Int) {
    self.x = x
    self.y = y
    self.state = .dead
  }
  
}
