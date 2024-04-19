//
//  CustomCell.swift
//  FirstApp
//
//  Created by Arpit on 20/04/24.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let label = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupCell() {
        label.textColor  = .black
        label.frame = CGRect(x: 15.0, y: 15.0, width: 150.0, height: 30.0)
        self.contentView.addSubview(label)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
