//
//  MainTableViewCell.swift
//  Ingredients
//
//  Created by Dimas Syuhada on 13/10/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    static let identifier = "MainTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    func configure(with model: IngredientsData){
        self.lblName.text = model.name
        self.imgThumbnail.downloadedFrom(link: model.thumb)
    }
    
}
