//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Furkan ic on 17.03.2024.
//

import UIKit
import Kingfisher

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    var pokemon: PokemonDataModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.iView.image = nil
        self.nameLabel.text = nil
        self.descLabel.text = nil
    }
}
