//
//  ViewController.swift
//  CardView
//
//  Created by Akhil C K on 12/28/17.
//  Copyright © 2017 CK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     @IBOutlet weak var collectioNview: UICollectionView!
     
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view, typically from a nib.
     }

     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 4
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
          return 1
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell") as? CTableViewCell
          cell?.textLabel?.text = "  Card -   \(indexPath.row)"
          cell?.layer.zPosition = CGFloat(indexPath.row * 10)
          cell?.innerViewLeading.constant =  CGFloat((15 + (8 - 2 * indexPath.row)))
          cell?.innerviewTrailing.constant =  CGFloat((15 + (8 - 2 * indexPath.row)))
          cell?.layoutIfNeeded()
          return cell!
     }
     
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          let cell = tableView.cellForRow(at: indexPath) as? CTableViewCell
          cell?.innerViewLeading.constant =  CGFloat((15 + (8 - 2 * indexPath.row)))
          cell?.innerviewTrailing.constant =  CGFloat((15 + (8 - 2 * indexPath.row)))
          cell?.layoutIfNeeded()

          return indexPath.row == 3 ? 140 : 35
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let cell = tableView.cellForRow(at: indexPath) as? CTableViewCell
          cell?.layer.zPosition = 30

          tableView.moveRow(at: indexPath, to: IndexPath(row: 3, section: 0))
          cell?.innerViewLeading.constant =  CGFloat((15))
          cell?.innerviewTrailing.constant =  CGFloat((15))
          cell?.layoutIfNeeded()

          
     }
     
}

extension UIView {
     
     
     func dropShadow(color: UIColor = UIColor.lightGray, opacity: Float = 0.5, offSet: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 5, scale: Bool = false) {
          self.layer.masksToBounds = false
          self.layer.shadowColor = color.cgColor
          self.layer.shadowOpacity = opacity
          self.layer.shadowOffset = offSet
          self.layer.shadowRadius = radius
          
          self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
          self.layer.shouldRasterize = false
          //self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
     }
}

