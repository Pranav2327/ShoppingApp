//
//  ProductsCollectionViewCell.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var percentageView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var truckImage: UIImageView!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var closeLine: UIView!
    @IBOutlet weak var mainView: CustomUIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        truckImage.layer.cornerRadius = 2
        mainView.layer.shadowColor = UIColor(red: 0.173, green: 0.165, blue: 0.161, alpha: 0.16).cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowRadius = 20
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
    }

}
