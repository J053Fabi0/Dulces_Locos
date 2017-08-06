//
//  CollectionViewController.swift
//  Dulces Locos
//
//  Created by Jose Fabio_ on 05/08/17.
//  Copyright © 2017 com.yoyomero.josefabio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {
    
    lazy var images: [String] = {
        let images: Images = Images()
        return images.getImagesArray()
    }()
    
    var indexPath: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
    
        let image = images[indexPath.row]
        
        cell.foto.image = UIImage.init(named: image)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailPage = segue.destination as! DetailViewController
        let selectedCell = sender as! UICollectionViewCell
        let indexPath = collectionView?.indexPath(for: selectedCell)
        
        detailPage.nombreArchivo = images[indexPath!.row]
        
    }

}
