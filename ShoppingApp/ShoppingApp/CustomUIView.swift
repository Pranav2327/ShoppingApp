//
//  CustomUIView.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import UIKit
@IBDesignable

class CustomUIView: UIView {
     let gradientLayer = CAGradientLayer()
    
    @IBInspectable var cornerRadiusValue: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = cornerRadiusValue
        }
    }
    
    @IBInspectable var borderWidthValue: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidthValue
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
           didSet {
            self.layer.borderColor = borderColor.cgColor
           }
       }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: -1, height: 1)
            self.layer.shadowRadius = 1
        }
    }
    
    @IBInspectable var gradientShow: Bool = false{
        didSet {
            if gradientShow == true{
//                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [UIColor(red: 0/255, green: 232/255, blue: 131/255, alpha: 1.0).cgColor, UIColor(red: 0/255, green: 189/255, blue: 255/255, alpha: 1.0).cgColor, UIColor(red: 121/255, green: 91/255, blue: 222/255, alpha: 1.0).cgColor]
                gradientLayer.frame.size = self.frame.size
                gradientLayer.startPoint = CGPoint(x: 0, y: 1)
                gradientLayer.endPoint = CGPoint(x: 1, y: 1)
                self.layer.insertSublayer(gradientLayer, at: 0)
            }else{
                if self.layer.sublayers != nil{
                    for layer in self.layer.sublayers!{
                        if layer.isKind(of: CAGradientLayer.self) {
                            layer.removeFromSuperlayer()
                        }
                    }
                }
            }
        }
    }

    var changeToRed: Bool = false {
        didSet {
            self.layer.borderColor = changeToRed ? UIColor.red.cgColor : CustomUIView.hexStringToUIColor(hex: "6E5B9A").cgColor
        }
    }
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

