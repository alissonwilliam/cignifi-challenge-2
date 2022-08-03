//
//  CustomRowTableViewCell.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 08/05/22.
//

import UIKit

class CustomRowTableViewCell: UITableViewCell {

    @IBOutlet weak var ProductLabel: UILabel!
    
    static let identifier:String = "CustomRowTableViewCell"
    
    static func nib() -> UINib{
        
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupCell(product:String){
        
        self.ProductLabel.text = product
  }
}
    
