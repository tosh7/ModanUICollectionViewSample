//
//  Array+extension.swift
//  ModanUICollectionViewSample
//
//  Created by Satoshi Komatsu on 2023/10/07.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
