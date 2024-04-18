//
//  HomeTableViewCell.swift
//  FirstApp
//
//  Created by Arpit on 15/04/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell 
{
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeTextLable: UILabel!
    @IBOutlet weak var showButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
