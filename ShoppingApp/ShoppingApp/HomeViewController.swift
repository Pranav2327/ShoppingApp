//
//  HomeViewController.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit
class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var homeTableView: UITableView!
    var listDetails : [HomeDataModel]?
    private var listViewModel : ListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ListAction()
        homeTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        homeTableView.register(UINib(nibName: "BannersTableViewCell", bundle: nil), forCellReuseIdentifier: "BannersTableViewCell")
        homeTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
    }
    func ListAction(){
            listViewModel = ListViewModel()
            listViewModel.bindListViewModelToController = {
                self.listDetails = self.listViewModel.listData ?? []
                self.homeTableView.reloadData()
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            cell.getCategoriesDetails(_model: listDetails?[0].value ?? [])
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannersTableViewCell") as! BannersTableViewCell
            cell.getBannersDetails(_model: listDetails?[1].value ?? [])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as! ProductsTableViewCell
            cell.getProductsDetails(_model: listDetails?[2].value ?? [])
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
