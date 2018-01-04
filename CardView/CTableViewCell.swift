//
//  CTableViewCell.swift
//  CardView
//
//  Created by Akhil C K on 12/28/17.
//  Copyright © 2017 CK. All rights reserved.
//

import UIKit

class CTableViewCell: UITableViewCell {

    
     @IBOutlet weak var innerView: UIView!
     @IBOutlet weak var cardHeader: UILabel!
     
     let gradientLayer: CAGradientLayer = {
          let layer = CAGradientLayer()
          layer.colors = [
               UIColor.red.cgColor,
               UIColor.green.cgColor
          ]
          return layer
     }()
     
     override func awakeFromNib() {
        super.awakeFromNib()
          
        // Initialization code
    }

     
     override func layoutSubviews() {
          super.layoutSubviews()
          self.innerView.dropShadow(color : UIColor.darkGray, opacity: 0.8,offSet:CGSize(width: 0, height: -2),radius:5, scale: false)
          gradientLayer.frame = innerView.bounds

     }
     
     func setColor(colorTop:UIColor,colorBottom:UIColor){
          
          gradientLayer.colors = [ colorTop.cgColor, colorBottom.cgColor]
          gradientLayer.locations = [ 0.0, 1.0]
          gradientLayer.cornerRadius = 8
          gradientLayer.frame = innerView.bounds
          self.innerView.layer.insertSublayer(gradientLayer, at:0)
          layoutSubviews()
     }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
