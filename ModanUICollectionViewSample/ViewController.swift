//
//  ViewController.swift
//  ModanUICollectionViewSample
//
//  Created by satoshi.komatsu on 2020/06/26.
//

import UIKit

final class ViewController: UIViewController {

    enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewのテストだよー！"
        configureHieraechy()
        configureDataSource()
    }
}

extension ViewController {
    private func createView() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

//これはDataSource的なやつ？？？
extension ViewController {
    //ここに関してはいわゆるAutlayout的なやつをかけ、addSubviewをしているだけである
    private func configureHieraechy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createView())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
    }

    private func configureDataSource() {
        //cellの中身をセット
        let celRRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item)"
            cell.contentConfiguration = content
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: celRRegistration, for: indexPath, item: identifier)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<12))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {

}
