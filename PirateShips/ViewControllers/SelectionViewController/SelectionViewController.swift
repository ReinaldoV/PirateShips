//
//  SelectionViewController.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 22/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

import UIKit

class SelectionViewController: UIViewController {

    let kBoatSelectionCellIdentifier = "kBoatSelectionCellIdentifier"

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Properties
    var titles: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(BoatSelectionCell.self, forCellWithReuseIdentifier: self.kBoatSelectionCellIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
}

// MARK: - UI Setup
extension SelectionViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white

        self.view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.45

        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)

        return layout
    }
}

// MARK: - UICollectionViewDelegate & Data Source
extension SelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.kBoatSelectionCellIdentifier, for: indexPath) as! BoatSelectionCell
        cell.titleLabel.text = titles[indexPath.item]
        return cell
    }

}
