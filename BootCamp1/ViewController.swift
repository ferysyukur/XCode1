//
//  ViewController.swift
//  BootCamp1
//
//  Created by Fery Syukur on 3/9/17.
//  Copyright © 2017 Fery Syukur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cellMovie: UICollectionView!
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Configure
    func setupCollectionView(){
        cellMovie.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        flowLayout.minimumInteritemSpacing = 4
        flowLayout.minimumLineSpacing = 4
        cellMovie.setCollectionViewLayout(flowLayout, animated: false)
        
        let width : CGFloat = (UIScreen.main.bounds.width - 24)/2
        let height : CGFloat = 100 + ((width / 3) * 4)
        flowLayout.itemSize = CGSize(width: width, height: height)
    }


}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
