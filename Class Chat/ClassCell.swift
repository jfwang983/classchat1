//
//  ClassCell.swift
//  Class Chat
//
//  Created by Angeli Faith Deanon on 12/10/20.
//

import UIKit

class ClassCell: UITableViewCell {
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
