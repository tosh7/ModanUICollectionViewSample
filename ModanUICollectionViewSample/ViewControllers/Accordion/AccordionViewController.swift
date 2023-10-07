//
//  AccordionViewController.swift
//  ModanUICollectionViewSample
//
//  Created by Satoshi Komatsu on 2023/10/07.
//

import UIKit

final class AccordionViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Accordion"
        view.backgroundColor = .white

        setupViews()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK - Views
    private var stackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.backgroundColor = .white
        return s
    }()

    private var accordionView: AccordionView = .init()

    // MARK - Methods
    private func setupViews() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        stackView.addArrangedSubview(accordionView)
    }
}
