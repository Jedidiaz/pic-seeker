//
//  ImageCollectionViewCell.swift
//  PSUIKIT
//
//  Created by Jedidiaz Fagundez on 19/06/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Oulets
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Border radius
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 10
    }
}
