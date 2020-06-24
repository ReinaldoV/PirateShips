//
//  BoatSelectionCell.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 22/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

class BoatSelectionCell: UICollectionViewCell {

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        setupUI()
    }

    // MARK: - Properties
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeueBold", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "placeHolderShip")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var moneyImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "goldCoins")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return image
    }()

}

// MARK: - UI Setup
extension BoatSelectionCell {
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(imageView)
        roundedBackgroundView.addSubview(priceLabel)
        roundedBackgroundView.addSubview(descriptionLabel)
        roundedBackgroundView.addSubview(moneyImageView)

        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            imageView.topAnchor.constraint(equalTo: self.roundedBackgroundView.topAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalTo: self.roundedBackgroundView.heightAnchor, multiplier: 0.55),
            imageView.leftAnchor.constraint(equalTo: self.roundedBackgroundView.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: self.roundedBackgroundView.rightAnchor, constant: 0),
            priceLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 7),
            priceLabel.leftAnchor.constraint(equalTo: self.roundedBackgroundView.leftAnchor, constant: 5),
            descriptionLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 7),
            descriptionLabel.leftAnchor.constraint(equalTo: self.roundedBackgroundView.leftAnchor, constant: 5),
            descriptionLabel.rightAnchor.constraint(equalTo: self.roundedBackgroundView.rightAnchor, constant: -7),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.roundedBackgroundView.bottomAnchor, constant: -14),
            moneyImageView.heightAnchor.constraint(equalToConstant: 20),
            moneyImageView.widthAnchor.constraint(equalToConstant: 20),
            moneyImageView.leftAnchor.constraint(equalTo: self.priceLabel.rightAnchor, constant: 2),
            moneyImageView.centerYAnchor.constraint(equalTo: self.priceLabel.centerYAnchor, constant: 4)
        ])

    }
}
