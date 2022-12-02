//
//  BannersTableViewCell.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit

class BannersTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var bannersCollectionView: UICollectionView!
    var bannersData = [ValuesModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        bannersCollectionView.register(UINib(nibName: "BannersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannersCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func getBannersDetails(_model : [ValuesModel]){
        bannersData = _model
        bannersCollectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannersData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannersCollectionViewCell", for: indexPath) as! BannersCollectionViewCell
        cell.bannersImageView.kf.setImage(with: URL(string: bannersData[indexPath.row].banner_url ?? "" ))
        return cell
        
    }
}
