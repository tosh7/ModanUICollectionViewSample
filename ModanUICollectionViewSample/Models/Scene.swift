//
//  Scene.swift
//  ModanUICollectionViewSample
//
//  Created by Satoshi Komatsu on 2023/10/07.
//

import Foundation
import UIKit

enum Scene: String, CaseIterable {
    case normal
    case uIListContentConfiguration
    case intrinsicContentSize
//    case accordion

    var vc: UIViewController {
        switch self {
        case .normal:
            return ViewController()
        case .uIListContentConfiguration:
            return ViewController()
        case .intrinsicContentSize:
            return ViewController()
        }
    }
}
