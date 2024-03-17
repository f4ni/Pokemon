//
//  OnboardingScreenButtonContainerView.swift
//  Pokemon
//
//  Created by Furkan ic on 17.03.2024.
//

import UIKit

class OnboardingScreenButtonContainerView: UIView {
        
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed("OnboardingScreenButtonContainerView", owner: self)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
}
