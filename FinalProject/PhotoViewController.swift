//
//  PhotoViewController.swift
//  FinalProject
//
//  Created by kevin on 2019/6/23.
//  Copyright © 2019 kevin. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var phtoCollectionView: UICollectionView!
    @IBOutlet weak var photoCollectionLayout: UICollectionViewFlowLayout!
    var photoArray: [String] = ["01", "02", "03", "04", "05", "06", "07", "08"]
    let fullScreenSize = UIScreen.main.bounds.size
    //var fullScreenSize :CGSize!

    private let reuseIdentifier = "photoCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        photoCollectionLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        photoCollectionLayout.itemSize = CGSize(width: fullScreenSize.width/3-30,height: 100)
        photoCollectionLayout.minimumLineSpacing = 5

        photoCollectionLayout.scrollDirection = .vertical
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image = UIImage(named: photoArray[indexPath.row])
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
