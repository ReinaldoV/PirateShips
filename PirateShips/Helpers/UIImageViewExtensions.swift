//
//  UIImageViewExtensions.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL?) {
        guard let urlNotOptional = url else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlNotOptional) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
