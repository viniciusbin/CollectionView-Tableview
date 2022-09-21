//
//  CategoryTableViewCell.swift
//  ChallengeCollectionTableView
//
//  Created by Vinicius on 08/08/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var subCategorylabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    static let tableViewCellIdentifier: String = "CategoryTableViewCell"
    var populateModelTableView: [CollectionViewCellModel] = []
    
    static func nib() -> UINib {
        return UINib(nibName: tableViewCellIdentifier, bundle: nil)
    }
    

    
    
    public func setupTableViewCell(subCategoryTitle: String, listColors: [CollectionViewCellModel]) {
        populateModelTableView = listColors
        subCategorylabel.text = subCategoryTitle
        collectionView.reloadData()
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SubCategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: SubCategoryCollectionViewCell.collectionViewCellIdentifier)
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
            collectionView.isPagingEnabled = true
            
        }
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate {
    
}

extension CategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populateModelTableView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCategoryCollectionViewCell.collectionViewCellIdentifier, for: indexPath) as? SubCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        collectionCell.setupCollectionViewCell(dataModel: populateModelTableView[indexPath.item])
        
        
        return collectionCell
    }
}
extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width / 1.1, height: collectionView.frame.height)
    }
}
