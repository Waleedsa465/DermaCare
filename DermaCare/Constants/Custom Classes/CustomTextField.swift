//
//  CustomTextField.swift
//  DermaCare
//
//  Created by MacBook Pro on 20/10/2024.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextField: UITextField {

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

    // Placeholder Color
    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet {
            updatePlaceholderColor()
        }
    }

    // Update placeholder color
    private func updatePlaceholderColor() {
        if let placeholder = placeholder {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: placeholderColor
            ]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }

    // Override for updating placeholder color when the placeholder is set
    override var placeholder: String? {
        didSet {
            updatePlaceholderColor()
        }
    }
    
    // Called when the view is rendered in Interface Builder
    override func prepareForInterfaceBuilder() {
        updatePlaceholderColor()
    }
}
