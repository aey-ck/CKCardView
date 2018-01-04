//
//  CTableViewCell.swift
//  CardView
//
//  Created by Akhil C K on 12/28/17.
//  Copyright © 2017 CK. All rights reserved.
//

import UIKit

class CTableViewCell: UITableViewCell {

     @IBOutlet weak var innerviewTrailing: NSLayoutConstraint!
     @IBOutlet weak var innerViewLeading: NSLayoutConstraint!
     @IBOutlet weak var innerView: UIView!
     override func awakeFromNib() {
        super.awakeFromNib()
          
        // Initialization code
    }

     
     override func layoutSubviews() {
          super.layoutSubviews()
          self.innerView.dropShadow(color : UIColor.darkGray, opacity: 0.8,offSet:CGSize(width: 0, height: -2),radius:5, scale: false)
     }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
