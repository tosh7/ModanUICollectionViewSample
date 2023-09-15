//
//  CustomeCollectionViewList.swift
//  ModanUICollectionViewSample
//
//  Created by Satoshi Komatsu on 2023/09/15.
//

import UIKit

final class CustomCell: UICollectionViewListCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false

        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        let hightConstraint = title.heightAnchor.constraint(equalToConstant: 150)
        hightConstraint.isActive = true
        // ここの1行のコメントアウトを外すと、制約のエラーが出ない
//        hightConstraint.priority = .defaultHigh
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var title: UILabel = .init()
}
