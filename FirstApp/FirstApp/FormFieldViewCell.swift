//
//  FormFieldViewCell.swift
//  FirstApp
//
//  Created by Arpit on 15/04/24.
//

import UIKit

class FormFieldViewCell: UITableViewCell 
{
    @IBOutlet weak var formLable: UILabel!
    @IBOutlet weak var formTextField: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
