//
//  TabBarViewController.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
       showViewControllers()
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.clipsToBounds = false
    }
    
    override func viewDidLayoutSubviews() {
//        tabBar.frame = CGRect(x: 0, y: self.view.frame.height-50, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
    }
    func showViewControllers() {
       //  1st View controller
       let HomeVc = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil).instantiateViewController(identifier: "HomeViewController")
       let iconHome = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home"))
        iconHome.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
       HomeVc.tabBarItem = iconHome
       
       //  2nd View controller
       let categoriesVc = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil).instantiateViewController(identifier: "CategoriesViewController")
       let iconCategory = UITabBarItem(title: "Categories", image: UIImage(named: "Categories"), selectedImage: UIImage(named: "Categories"))
        iconCategory.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        categoriesVc.tabBarItem = iconCategory
       
       //  3rd View controller
       let offersVc = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil).instantiateViewController(identifier: "OffersViewController")
       let iconOffers = UITabBarItem(title: "Offers", image: UIImage(named: "Offers"), selectedImage: UIImage(named: "Offers"))
        iconOffers.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        offersVc.tabBarItem = iconOffers
       
       //  4th View controller
       let cartVc = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil).instantiateViewController(identifier: "CartViewController")
       let iconCart = UITabBarItem(title: "Cart", image: UIImage(named: "Cart"), selectedImage: UIImage(named: "Cart"))
        iconCart.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        cartVc.tabBarItem = iconCart
       
       //  5th View controller
       let accountVc = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil).instantiateViewController(identifier: "AccountViewController")
       let iconAccount = UITabBarItem(title: "Account", image: UIImage(named: "Account"), selectedImage: UIImage(named: "Account"))
        iconAccount.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        accountVc.tabBarItem = iconAccount
       
       let controllers = [HomeVc, categoriesVc, offersVc, cartVc, accountVc]
       self.viewControllers = controllers
       
      
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
       return self.selectedViewController?.preferredStatusBarStyle ?? .default
   }
   
   override var childForStatusBarStyle: UIViewController? {
       return selectedViewController
   }
    

}

