//
//  Grids.swift
//  LYDGameOfLife
//
//  Created by Lydia Zhang on 6/23/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation
import UIKit

class Grid {
    var cells = [Cell]()
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        
        for i in 0..<x {
            for j in 0..<y {
                let cell = Cell(state: .none, position: Coordinate(x: j, y: i))
                cells.append(cell)
            }
        }
    }
    func update(){
        var updatedCells = [Cell]()
        
        for cell in cells {
            let nearby = cells.filter{ $0.isNearby(cell: cell)} // nearby cell for each cell
            
            let nearbyAlived = nearby.filter{ $0.state == .alive}
            
            switch nearbyAlived.count {
            case 3:
                let newCell = Cell(state: .alive, position: cell.position)
                updatedCells.append(newCell)
            case 2:
                if cell.state == .none || cell.state == .dead {
                    let newCell = Cell(state: .dead, position: cell.position)
                    updatedCells.append(newCell)
                } else if cell.state == .alive {
                    updatedCells.append(cell)
                }
            default:
                let newCell = Cell(state: .dead, position: cell.position)
                updatedCells.append(newCell)
            }
        }
        self.cells = updatedCells
    }
    
}
