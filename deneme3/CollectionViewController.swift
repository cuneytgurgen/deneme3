//
//  CollectionViewController.swift
//  deneme3
//
//  Created by Öğrenci on 6.03.2017.
//  Copyright © 2017 irem. All rights reserved.
//

import UIKit



class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var label3: UILabel!
    var int:Float=20.0
 
    @IBAction func slider(_ sender: Any) {
        
        if int==slider.value*100.0 {
            return
        }else{
            int=slider.value*100.0
            let deger = (Int)(int)
            label3.text = ("\(deger)")
            CollectionView.reloadData()
        }
        
        
    }
    @IBOutlet weak var slider: UISlider!
    let reusable="CollectionViewCell"
    
    
    
    override func viewDidLoad(){
        let nib:UINib = UINib.init(nibName: reusable,bundle: nil)
        CollectionView.register(nib, forCellWithReuseIdentifier: reusable)
    
    
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell=CollectionView.dequeueReusableCell(withReuseIdentifier: reusable, for: indexPath)as!CollectionViewCell
        cell.label.text="cuneyt"
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return (Int)(int)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier:"showfoto", sender: CollectionView.cellForItem(at: indexPath))
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller=segue.destination as!fotoViewController
        let cell=sender as!CollectionViewCell
        controller.str=cell.label.text!
    }

}
