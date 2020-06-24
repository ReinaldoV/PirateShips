//
//  SelectionViewController.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 22/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    let kBoatSelectionCellIdentifier = "kBoatSelectionCellIdentifier"
    var presenter: SelectionPresenterProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.presenter?.retrieveData()
    }

    // MARK: - Properties

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(BoatSelectionCell.self, forCellWithReuseIdentifier: self.kBoatSelectionCellIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var safeAreaView: UIView = {
        let view = UIView()
        return view
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
        self.view.addSubview(safeAreaView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            safeAreaView.topAnchor.constraint(equalTo: self.view.topAnchor),
            safeAreaView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            safeAreaView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            safeAreaView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.45
        let cellHeightConstant: CGFloat = (cellWidthConstant * 1.15)

        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 15,
                                           bottom: 0,
                                           right: 15)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)

        return layout
    }
}

// MARK: - UICollectionViewDelegate & Data Source
extension SelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.numberOfCells() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.kBoatSelectionCellIdentifier,
                                                         for: indexPath) as? BoatSelectionCell,
            let shipInfo = self.presenter?.shipInfo(atIndex: indexPath.row) {
            cell.priceLabel.text = shipInfo.price?.description ?? ""
            cell.moneyImageView.isHidden = shipInfo.price == nil
            cell.descriptionLabel.text = shipInfo.title ?? shipInfo.description
            cell.imageView.load(url: shipInfo.imageURL)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let presenter = self.presenter,
            let ship = presenter.shipInfo(atIndex: indexPath.row),
            let cell = self.collectionView.cellForItem(at: indexPath) as? BoatSelectionCell else { return }
        let detailViewController = DetailViewController()
        let detailPresenter = DetailPresenter(ship: ship, imageAlreadyLoaded: cell.imageView.image)
        detailViewController.detailPresenter = detailPresenter

        self.show(detailViewController, sender: nil)
    }
}

extension SelectionViewController: SelectionViewControllerProtocol {
    func refreshTable() {
        self.collectionView.reloadData()
    }

    func startLoading() {

    }

    func stopLoading() {

    }

    func showMessage(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
