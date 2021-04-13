//
//  Colors.swift
//  videoLlamada
//
//  Created by Gio Valdes on 17/03/21.
//

import UIKit

extension UIColor {
    
    static let lightBlue      = UIColor.rgb(red: 231,green: 239,blue: 255)
    static let lightGray      = UIColor.rgb(red: 248,green: 249,blue: 250)
    
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
