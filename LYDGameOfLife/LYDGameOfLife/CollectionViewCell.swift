//
//  CollectionViewCell.swift
//  LYDGameOfLife
//
//  Created by Lydia Zhang on 6/23/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var vc: ViewController?
    
    var grid: Grid?
    
    var cell: Cell? {
        didSet {
            setUp()
        }
    }
    
    func setUp() {
        guard let cell = cell else {return}
        if cell.state == .none {
            button.layer.backgroundColor = CGColor(srgbRed: 0.73, green: 0.73, blue: 0.73, alpha: 1)
        } else if cell.state == .alive {
            button.layer.backgroundColor = CGColor(srgbRed: 0.69, green: 0.34, blue: 0.34, alpha: 1)
        } else {
            button.layer.backgroundColor = CGColor(srgbRed: 0.55, green: 0.49, blue: 0.42, alpha: 1)
        }
    }
    @IBOutlet var button: UIButton!
    @IBAction func buttonTapped(_ sender: Any) {
        guard let cell = cell, let grid = grid else {return}
        guard let index = grid.cells.firstIndex(where: { $0.position.x == cell.position.x && $0.position.y == cell.position.y}) else {return}
        if cell.state == .none {
            
            grid.cells[index].state = .alive
            guard let vc = vc else {return}
            vc.collectionView.reloadData()
        } else if cell.state == .alive {
            
            grid.cells[index].state = .none
            guard let vc = vc else {return}
            vc.collectionView.reloadData()
        }
        setUp()
    }
}
