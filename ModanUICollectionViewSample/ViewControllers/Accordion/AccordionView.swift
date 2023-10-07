//
//  AccordionView.swift
//  ModanUICollectionViewSample
//
//  Created by Satoshi Komatsu on 2023/10/07.
//

import UIKit

final class AccordionView: UIView {

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK - Views
    private var header: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        return v
    }()

    private var body: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        return v
    }()

    // MAKKL - Methods
    private func setupViews() {
        addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 50).isActive = true

        addSubview(body)
        body.translatesAutoresizingMaskIntoConstraints = false
        body.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        body.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        body.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        body.heightAnchor.constraint(equalToConstant: 200).isActive = true
        body.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
