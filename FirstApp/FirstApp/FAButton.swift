//
//  FAButton.swift
//  FirstApp
//
//  Created by Arpit on 18/04/24.
//

import UIKit

class FAButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var customBakcgroundColor: UIColor = .green {
        didSet {
            backgroundColor = customBakcgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUpButton()
    }
    
    private func setUpButton() {
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font  = UIFont.systemFont(ofSize: 14)
        self.layer.cornerRadius = 5
        self.backgroundColor = customBakcgroundColor
    }
    

}
