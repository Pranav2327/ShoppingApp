//
//  CategoryTableViewCell.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit
import Kingfisher
class CategoryTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    var categoriesData = [ValuesModel]()
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func getCategoriesDetails(_model : [ValuesModel]){
        categoriesData = _model
        categoriesCollectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.categoryImageView.kf.setImage(with: URL(string: categoriesData[indexPath.row].image_url ?? "" ))
        cell.categoryLabel.text = categoriesData[indexPath.row].name
        return cell
        
    }
}
