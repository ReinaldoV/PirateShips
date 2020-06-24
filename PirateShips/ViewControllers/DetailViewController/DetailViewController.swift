//
//  DetailViewController.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 24/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailPresenter: DetailPresenterProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadData()
    }

    // MARK: - Properties
    lazy var backgroundView: UIView = {
        let backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.clipsToBounds = true
        return backgroundView
    }()

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "placeHolderShip")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeueBold", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeueBold", size: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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

    lazy var greetingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium, scale: .default)
        let image = UIImage(systemName: "message.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .systemGray
        button.layer.cornerRadius = 23
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

// MARK: - UI Setup
extension DetailViewController {
    private func setupUI() {
        self.view.addSubview(backgroundView)
        self.backgroundView.addSubview(imageView)
        self.backgroundView.addSubview(priceLabel)
        self.backgroundView.addSubview(moneyImageView)
        self.backgroundView.addSubview(titleLabel)
        self.backgroundView.addSubview(descriptionLabel)
        self.backgroundView.addSubview(greetingButton)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: self.backgroundView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.backgroundView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.backgroundView.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: self.backgroundView.heightAnchor, multiplier: 0.55),
            priceLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 7),
            priceLabel.leftAnchor.constraint(equalTo: self.backgroundView.leftAnchor, constant: 5),
            moneyImageView.heightAnchor.constraint(equalToConstant: 20),
            moneyImageView.widthAnchor.constraint(equalToConstant: 20),
            moneyImageView.leftAnchor.constraint(equalTo: self.priceLabel.rightAnchor, constant: 2),
            moneyImageView.bottomAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 2),
            titleLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 7),
            titleLabel.leftAnchor.constraint(equalTo: self.backgroundView.leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: self.backgroundView.rightAnchor, constant: 7),
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 7),
            descriptionLabel.leftAnchor.constraint(equalTo: self.backgroundView.leftAnchor, constant: 5),
            descriptionLabel.rightAnchor.constraint(equalTo: self.backgroundView.rightAnchor, constant: 7),
            greetingButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            greetingButton.rightAnchor.constraint(equalTo: self.backgroundView.rightAnchor, constant: -20),
            greetingButton.widthAnchor.constraint(equalToConstant: 46),
            greetingButton.heightAnchor.constraint(equalToConstant: 46)
        ])

    }
}

// MARK: - Data Setup
extension DetailViewController {
    func loadData() {
        guard let presenter = self.detailPresenter else { return }
        self.imageView.image = presenter.image()
        self.titleLabel.text = presenter.title()
        self.descriptionLabel.text = presenter.description()
        self.priceLabel.text = presenter.price()
    }
}

