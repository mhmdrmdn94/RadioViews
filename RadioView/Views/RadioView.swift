//
//  RadioView.swift
//  RadioView
//
//  Created by Mo-Ramadan Abdelhafez on 7/13/18.
//  Copyright © 2018 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable open class RadioView: UIView {
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var isSelected: Bool = true {
        didSet {
            backgroundColor = isSelected ? borderColor : .clear
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        addTapGestureRecognizer(view: self)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
}

fileprivate extension RadioView {
    fileprivate func addTapGestureRecognizer(view: UIView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(tapGestureRecognizer:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func viewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.isSelected = !isSelected
    }
}
