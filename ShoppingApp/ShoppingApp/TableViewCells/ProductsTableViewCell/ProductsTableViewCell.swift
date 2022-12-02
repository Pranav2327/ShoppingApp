//
//  ProductsTableViewCell.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit

class ProductsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var productsCollectionView: UICollectionView!
    var productsData = [ValuesModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        productsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func getProductsDetails(_model : [ValuesModel]){
        productsData = _model
        productsCollectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        cell.productImageView.kf.setImage(with: URL(string: productsData[indexPath.row].image ?? "" ))
        cell.actualPrice.text = productsData[indexPath.row].actual_price
        cell.offerPrice.text = productsData[indexPath.row].offer_price
        cell.productName.text = productsData[indexPath.row].name
        cell.actualPrice.text = productsData[indexPath.row].actual_price
        cell.offerLabel.text = "\(productsData[indexPath.row].offer ?? 0)% OFF"
        if (productsData[indexPath.row].offer ?? 0) > 0 {
            cell.offerView.isHidden = false
        }else{
            cell.offerView.isHidden = true
        }
        if productsData[indexPath.row].is_express ?? false{
            cell.truckImage.isHidden = false
        }else{
            cell.truckImage.isHidden = true
        }
        if (productsData[indexPath.row].actual_price) == (productsData[indexPath.row].offer_price) {
            cell.offerPrice.isHidden = true
            cell.closeLine.isHidden = true
        }else{
            cell.offerPrice.isHidden = false
            cell.closeLine.isHidden = false
        }
        return cell
        
    }
    
}
