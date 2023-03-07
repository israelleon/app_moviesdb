//
//  UIImage+Resiz.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 06/03/23.
//

import UIKit

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
