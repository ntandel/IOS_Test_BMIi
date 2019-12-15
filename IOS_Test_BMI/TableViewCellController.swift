//
//  TableViewCellController.swift
//  IOS_Test_BMI
//
//  Created by Nisha Tandel on 2019-12-14.
//  Copyright © 2019 Nisha TAndel. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {
    @IBOutlet weak var disName: UILabel!
    
    @IBOutlet weak var disHeight: UILabel!
    
    @IBOutlet weak var disWeight: UILabel!
    @IBOutlet weak var disBmi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
