//
//  ViewController.swift
//  LYDGameOfLife
//
//  Created by Lydia Zhang on 6/23/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var startButton: UIButton!
    var grid = Grid(x: 7, y: 8)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grid.cells.count
    }
    
    @IBOutlet var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.grid = grid
        cell.cell = grid.cells[indexPath.row]
        cell.vc = self
        return cell
    }
    
    
    @IBAction func startTapped(_ sender: Any) {
        collectionView.isUserInteractionEnabled = false
        startButton.setTitle("Next", for: .normal)
        grid.update()
        collectionView.reloadData()
    }

    @IBAction func resetTapped(_ sender: Any) {
        let newGrid = Grid(x: 7, y: 8)
        grid = newGrid
        collectionView.isUserInteractionEnabled = true
        startButton.setTitle("Start", for: .normal)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

}

