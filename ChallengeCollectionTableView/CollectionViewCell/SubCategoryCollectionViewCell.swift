//
//  SubCategoryCollectionViewCell.swift
//  ChallengeCollectionTableView
//
//  Created by Vinicius on 08/08/22.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorNameLabel: UILabel!
    static let collectionViewCellIdentifier: String = "SubCategoryCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: collectionViewCellIdentifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupCollectionViewCell(dataModel:CollectionViewCellModel) {
        colorView.backgroundColor = dataModel.color
        colorNameLabel.text = dataModel.name
    }
}
