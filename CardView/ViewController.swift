//
//  ViewController.swift
//  CardView
//
//  Created by Akhil C K on 12/28/17.
//  Copyright © 2017 CK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     @IBOutlet weak var tableView: UITableView!
     
     override func viewDidLoad() {
          super.viewDidLoad()
          tableView.register(UINib(nibName: "CardA", bundle: nil), forCellReuseIdentifier: "CardA")
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
          
          var colorTop:UIColor?
          var colorBottom:UIColor?
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "CardA") as? CTableViewCell
          cell?.selectionStyle = .none
          cell?.cardHeader?.text = "CARD - \(indexPath.row)"
          cell?.layer.zPosition = CGFloat(indexPath.row * 10)
          cell?.backgroundColor = UIColor.clear
          cell?.contentView.backgroundColor = UIColor.clear
          if indexPath.row == 0 {
               
               colorTop = UIColor(red: 241.0/255.0, green: 125.0/255.0, blue: 77.0/255.0, alpha: 1.0)
               colorBottom = UIColor(red: 219.0/255.0, green: 82.0/255.0, blue: 26.0/255.0, alpha: 1.0)
          } else if indexPath.row == 1 {
               
               colorTop = UIColor(red: 255.0/255.0, green: 220.0/255.0, blue: 83.0/255.0, alpha: 1.0)
               colorBottom = UIColor(red: 219.0/255.0, green: 179.0/255.0, blue: 24.0/255.0, alpha: 1.0)
          } else if indexPath.row == 2 {
               
               colorTop = UIColor(red: 50.0/255.0, green: 144.0/255.0, blue: 50.0/255.0, alpha: 1.0)
               colorBottom = UIColor(red: 86.0/255.0, green: 89.0/255.0, blue: 98.0/255.0, alpha: 1.0)
          } else {
               
               colorTop =  UIColor(red: 113.0/255.0, green: 183.0/255.0, blue: 255.0/255.0, alpha: 1.0)
               colorBottom = UIColor(red: 72.0/255.0, green: 120.0/255.0, blue: 166.0/255.0, alpha: 1.0)
          }
          
          cell?.setColor(colorTop:colorTop!,colorBottom:colorBottom!)
          
          return cell!
     }
     
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

          return indexPath.row == 3 ? 140 : 35
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let cell = tableView.cellForRow(at: indexPath) as? CTableViewCell
          cell?.layer.zPosition = 30

          tableView.moveRow(at: indexPath, to: IndexPath(row: 3, section: 0))
          

          
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

