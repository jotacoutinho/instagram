//
//  UIColor.swift
//  Instagram
//
//  Created by João Pedro De Souza Coutinho on 27/11/19.
//  Copyright © 2019 João Pedro De Souza Coutinho. All rights reserved.
//

import UIKit

extension UIColor {
    static var primaryColor: UIColor {
        return UIColor(named: "PrimaryColor") ?? UIColor.init(red: 13/255, green: 13/255, blue: 13/255, alpha: 1)
    }
    static var secondaryColor: UIColor {
        return UIColor(named: "SecondaryColor") ?? UIColor.init(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    }
    static var highlightColor: UIColor {
        return UIColor(named: "HighlightColor") ?? UIColor.init(red: 198/255, green: 158/255, blue: 108/255, alpha: 1)
    }
}
