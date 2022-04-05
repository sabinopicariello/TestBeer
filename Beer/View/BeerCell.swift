//
//  BeerCell.swift
//  Beer
//
//  Created by Sabino Picariello on 05/04/22.
//

import UIKit

class BeerCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    func setCard(picture: String, name: String, description: String, abv: Double?, ibu: Double?){
        
        let imageUrl = URL(string: picture)!
        let imageData = try! Data(contentsOf: imageUrl)
        
        pictureView.image = UIImage(data: imageData)
        nameLabel.text = name
        descriptionLabel.text = description
        if let _abv = abv {
            abvLabel.text = String(format: "%.1f", _abv)
        } else {
            abvLabel.text = "N/A"
        }
        
        if let _ibu = ibu {
            ibuLabel.text = String(format: "%.1f", _ibu)
        } else {
            ibuLabel.text = "N/A"
        }
        
        
        
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 10.0
    }
    
}
