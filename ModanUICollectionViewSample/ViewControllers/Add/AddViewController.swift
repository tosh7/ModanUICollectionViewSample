//
//  AddViewController.swift
//  ModanUICollectionViewSample
//
//  Created by satoshi.komatsu on 2020/06/27.
//

import UIKit

final class AddViewController: UIViewController {
    var close: (() -> Void)?

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        close?()
    }
}
