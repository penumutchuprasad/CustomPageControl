//CircleView.swift
/*
 * WalkthroughTutorial
 * Created by penumutchu.prasad@gmail.com on 07/09/18
 * Is a product created by abnboys
 * For the WalkthroughTutorial in the WalkthroughTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class DotView: UIView {
    
    var isSelected: Bool = false {
        didSet{
            
            self.backgroundColor = self.isSelected ? selectedColor : accentColor
            self.layer.cornerRadius = self.isSelected ? 8 : self.bounds.width / 2
            self.transform = self.isSelected ? CGAffineTransform.init(scaleX: 1.35, y: 0.85) : .identity
        }
    }
    
    var selectedColor = UIColor.green
    var accentColor = UIColor.red

    override var bounds: CGRect {
        didSet{
            setupView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
        self.backgroundColor = self.isSelected ? selectedColor : accentColor

    }
   
}
