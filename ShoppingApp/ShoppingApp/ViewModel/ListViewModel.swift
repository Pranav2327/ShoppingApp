//
//  ListViewModel.swift
//  ShoppingApp
//
//  Created by mac on 03/12/22.
//

import Foundation
class ListViewModel:NSObject{
    
    
    private(set) var listData : [HomeDataModel]! {
        didSet {
            self.bindListViewModelToController()
        }
    }
    var bindListViewModelToController : (() -> ()) = {}
    override init() {
        super.init()
        self.ListData()
    }
    func ListData() {
        let listRequest:NetworkRouter = .listRequest
        networkLayer.request(listRequest, type:MainResponseModel.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .sucess(let model):
                self.listData = model.homeData ?? []
            case .failure(let errorString):
                print(errorString)
            }
        }
    }
    
}
