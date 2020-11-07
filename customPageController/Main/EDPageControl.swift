//
//  EDPageControl.swift
//  customPageController
//
//  Created by eslam dweeb on 7/11/2020.
//  Copyright © 2020 eslam dweeb. All rights reserved.
//

import UIKit

class EDPageControl:UIView{
    
    var numberOfPage:Int = 0{
        didSet{
            setupView(numberOfPage)
        }
    }
    var currentPage:Int = 0{
        didSet{
            changeIndex(pageNumber: currentPage)
        }
    }
    lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(numberOfPage)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(_ number:Int){
        guard number != 0 else{return}
        for i in 1...number {
            let dashind = DashIndicator()
            if i == 1 {
                dashind.selected = true
            }else{
                dashind.selected = false
            }
            stackView.addArrangedSubview(dashind)
        }
        print(stackView.arrangedSubviews.count)
    }
    func changeIndex(pageNumber:Int){
        for (index,view) in stackView.arrangedSubviews.enumerated(){
            if index == pageNumber {
                let dashView = view as! DashIndicator
                dashView.selected = true
            }else{
                let dashView = view as! DashIndicator
                dashView.selected = false
            }
        }
    }
}
