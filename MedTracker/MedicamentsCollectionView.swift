//
//  MedicamentsCollectionView.swift
//  MedTracker
//
//  Created by Roman on 18.07.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import UIKit

class MedicamentsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    weak var vc: UIViewController?

    var cells = [Any]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  5//cells.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = dequeueReusableCell(withReuseIdentifier: PillsCollectionViewCell.reuseId, for: indexPath) as! PillsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("нажата \(indexPath.item) ячейка")
        vc?.performSegue(withIdentifier: "goToAdd", sender: nil)
        

    }
  



    
    

    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 40, height: frame.height * 0.85)
    }
    init(vc: UIViewController){
        self.vc = vc
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = #colorLiteral(red: 0.971986115, green: 1, blue: 0.8419048786, alpha: 1)
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        
        
        delegate = self
        dataSource = self
        
        
        register(PillsCollectionViewCell.self, forCellWithReuseIdentifier: PillsCollectionViewCell.reuseId)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        
    }
    
    func set<T: Any> (cells: [T]){
        self.cells = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

func gooo(){
    
}


    


