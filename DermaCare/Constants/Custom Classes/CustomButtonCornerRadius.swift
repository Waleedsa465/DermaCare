//
//  CustomButtonCornerRadius.swift
//  DermaCare
//
//  Created by MacBook Pro on 20/10/2024.
//

import Foundation
import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    // Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    // Border Color
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // Border Width
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // Called when the view is rendered in Interface Builder
    override func prepareForInterfaceBuilder() {
        // This method is called in Interface Builder to update the button appearance
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
