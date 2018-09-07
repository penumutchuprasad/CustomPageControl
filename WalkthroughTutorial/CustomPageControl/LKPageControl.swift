//LKPageControl.swift
/*
 * WalkthroughTutorial
 * Created by penumutchu.prasad@gmail.com on 07/09/18
 * Is a product created by abnboys
 * For the WalkthroughTutorial in the WalkthroughTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

@IBDesignable
class LKPageControl: UIControl {
    
    //MARK:- Properties
    @IBInspectable var numberOfPages: Int = 0 {
        didSet{
//            self.numberOfDots = Array.init(repeating: DotView.init(), count: numberOfPages)
            for tag in 0 ..< numberOfPages {
                let dot = DotView.init(frame: .zero)
                dot.tag = tag
                self.numberOfDots.append(dot)
            }
            self.numberOfDots.forEach { $0.backgroundColor = .red }

        }
    }
    
    var currentPage: Int = 0 {
        didSet{
            
            for dot in numberOfDots {
                dot.isSelected = dot.tag == currentPage
            }

        }
    }
    
    var hidesForSinglePage: Bool = false
    
    var pageIndicatorTintColor: UIColor? = .green {
        didSet{
            self.numberOfDots.forEach { $0.selectedColor = pageIndicatorTintColor! }
        }
    }
    var currentPageIndicatorTintColor: UIColor? = .red {
        didSet{
            self.numberOfDots.forEach { $0.accentColor = pageIndicatorTintColor! }
        }
    }
    
    private var numberOfDots = [DotView]() {
        didSet{
            if numberOfDots.count == numberOfPages {
                setupViews()
            }
        }
    }
    
    private lazy var stackView = UIStackView.init(frame: self.bounds)
    
    //MARK:- Intialisers
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(withNoOfPages pages: Int) {
        
        self.numberOfPages = pages
        self.currentPage = 0
        self.hidesForSinglePage = false
        super.init(frame: .zero)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    //MARK:- Methods
    
    private func setupViews() {
        
        self.numberOfDots.forEach { (dot) in
            dot.translatesAutoresizingMaskIntoConstraints = false
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(onDotSelected(_:)))
            dot.addGestureRecognizer(tap)
            
            self.stackView.addArrangedSubview(dot)
        }
        
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        let constantSpace = (stackView.spacing) * CGFloat(numberOfPages - 1) + ((self.bounds.height * 0.85) * CGFloat(numberOfPages))

        self.addConstraints([
            
                stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9, constant: 0),
                stackView.widthAnchor.constraint(equalToConstant: constantSpace)
    
            ])
        
        self.numberOfDots.forEach { dot in
            
            self.addConstraints([
                
                dot.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor),
                dot.widthAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.85, constant: 0),
                dot.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.85, constant: 0)
                
                ])
            
        }
        
    }
    
    @objc private func onDotSelected(_ sender: UITapGestureRecognizer) {
        
        guard let selDot = sender.view as? DotView else { return }
        
//        for dot in numberOfDots {
//
//            dot.isSelected = dot.tag == selDot.tag ? true : false
//            currentPage = selDot.tag
//
//        }
        
        numberOfDots.forEach { (dot) in
            dot.isSelected = dot.tag == selDot.tag
        }
        currentPage = selDot.tag

        self.sendActions(for: .valueChanged)
    }
    
    override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
       super.sendAction(action, to: target, for: event)
        
    }
    
    

//    // returns minimum size required to display dots for given page count. can be used to size control if page count could change
//    func size(forNumberOfPages pageCount: Int) -> CGSize {
//
//
//        return .zero
//    }
    
   
}
    
