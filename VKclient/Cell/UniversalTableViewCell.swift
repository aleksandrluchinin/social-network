//
//  UniversalTableViewCell.swift
//  VKclient
//
//  Created by Aleksandr  on 14.03.2023.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descripshionLabel: UILabel!
    
    override func prepareForReuse() {
        mainImageView.image = nil
        nameLabel.text = nil
        descripshionLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(image: UIImage?, name: String?, descripshion: String?) {
        mainImageView.image = image
        nameLabel.text = name
        descripshionLabel.text = descripshion
    }
}
