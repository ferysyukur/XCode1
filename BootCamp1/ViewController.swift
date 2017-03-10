//
//  ViewController.swift
//  BootCamp1
//
//  Created by Fery Syukur on 3/9/17.
//  Copyright © 2017 Fery Syukur. All rights reserved.
//

//struct Movies {
//    let title: String
//    let genre: String
//}

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cellMovie: UICollectionView!
    var refreshControl : UIRefreshControl = UIRefreshControl()
    var iImage = 1
    
    var arrayMovie: [MovieModel] = []
//    let arrayMovie: [Movies] = [
//        Movies(title: "Logan", genre: "Action"),
//        Movies(title: "Resident Evil", genre: "Horor"),
//        Movies(title: "Logan 2", genre: "Action"),
//        Movies(title: "Resident Evil 2", genre: "Horor"),
//        Movies(title: "Logan 3", genre: "Action"),
//        Movies(title: "Resident Evil 3", genre: "Horor"),
//        Movies(title: "Logan 2", genre: "Action"),
//        Movies(title: "Resident Evil 4", genre: "Horor"),
//        Movies(title: "Logan 3", genre: "Action"),
//        Movies(title: "Resident Evil 4", genre: "Horor")
//    ]
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
        refreshControl.beginRefreshing()
        downloadData()
    }
    
    //MARK: - Data
    func downloadData(){
        Engine.shared.getLisMovie{[weak self](result, error) in
            
            guard let strongSelf = self else {return}
            
            strongSelf.refreshControl.endRefreshing()
            
            if let result = result as? [MovieModel]{
                strongSelf.arrayMovie = result
                strongSelf.cellMovie.reloadData()
            }else if let error = error{
                let alert = UIAlertController.init(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                
                let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okAction)
                
                strongSelf.present(alert, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Configure
    func setupCollectionView(){
        refreshControl.addTarget(self, action: #selector(handleRefresh(sender:)), for: .valueChanged)
        cellMovie.addSubview(refreshControl)
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
    
    //MARK: - Action
    func handleRefresh(sender: UIRefreshControl) {
//        iImage += 1
//        cellMovie.reloadData()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//            self.cellMovie.reloadData()
//            self.refreshControl.endRefreshing()
//        }
        downloadData()
    }


}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = arrayMovie[indexPath.item];
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieViewCell
        
//        if let url = URL(string: "\(IMG_URL)\((indexPath.row + 1) * iImage)"){
        if let url = movie.imageUrl{
            cell.loading.startAnimating()
            cell.imgMovie.sd_setImage(with: url, completed: { (image, error, cache, url) in
                if error == nil{
                    cell.loading.stopAnimating()
                }
            })
        }
        
        
        cell.lblTitle.text = movie.title?.uppercased()
        cell.lblDesc.text = movie.overview
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMovie.count
    }
}
