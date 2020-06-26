//
//  Cell.swift
//  LYDGameOfLife
//
//  Created by Lydia Zhang on 6/23/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation

enum CellState {
    case alive
    case dead
    case none
}


struct Cell {

    var state: CellState
    var position: Coordinate
    
    func isNearby(cell: Cell) -> Bool {
        let i = self.position.x - cell.position.x
        let j = self.position.y - cell.position.y
        
        switch (i,j) {
        case (1, 1), (0, 1), (1, 0),(-1,0),(0,-1),(-1,-1),(-1,1),(1,-1):
            return true
        default:
            return false
        }
        
    }
    
}
