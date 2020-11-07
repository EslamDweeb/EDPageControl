//
//  DashIndicator.swift
//  customPageController
//
//  Created by eslam dweeb on 7/11/2020.
//  Copyright © 2020 eslam dweeb. All rights reserved.
//

import UIKit

class DashIndicator:UIView{
    private var height:CGFloat = 7
    private var unSelectedWidth:CGFloat = 15
    private var selectedWidth:CGFloat = 30
    private var unSelectedColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    private var selectedColor = #colorLiteral(red: 0.9921568627, green: 0.3725490196, blue: 0, alpha: 1)
    private var width:NSLayoutConstraint?
    
    var selected:Bool?{
        didSet  {
            guard let selected = selected else{return}
            animateDash(selected)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setup(){
        heightAnchor.constraint(equalToConstant: height).isActive = true
        width = widthAnchor.constraint(equalToConstant: unSelectedWidth)
        width?.isActive = true
        backgroundColor = unSelectedColor
    }
    private func animateDash(_ selected:Bool){
        if  selected{
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.width?.constant = self.selectedWidth
                self.backgroundColor = self.selectedColor
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.width?.constant = self.unSelectedWidth
                self.backgroundColor = self.unSelectedColor
            }, completion: nil)
        }
    }
}
