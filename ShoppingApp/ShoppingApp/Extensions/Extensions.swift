//
//  File.swift
//  ShoppingApp
//
//  Created by mac on 03/12/22.
//

import Foundation
import UIKit
let networkLayer = NetworkLayer.shared
// MARK: UIDevice
extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return false }
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
// MARK: UIWindow
extension UIWindow {
    static var key: UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
public enum Storyboard: String {
    case main = "Main"
    case tabBar = "Tabbar"
    case user = "User"
    case post = "Post"
    case onBoarding = "OnBoarding"
    case profile = "Profile"
    case search = "Search"
}
