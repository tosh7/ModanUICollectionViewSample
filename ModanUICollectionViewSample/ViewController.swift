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

        navigationItem.title = "タイトル"
        configureHieraechy()
        configureDataSource()
    }
}

extension ViewController {
    private func createView() -> UICollectionViewLayout {
        //ここでcollectionViewの種類を設定、今まで通り使うならplainかな
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
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

        //dataSOurceの中身をセット
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: celRRegistration, for: indexPath, item: identifier)
        }

        //snapshotがなぜ必要？？？
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        //sectionをセット
        snapshot.appendSections([.main])
        //これは配列の数
        snapshot.appendItems(Array(0..<12))
        //snapshotを適用させている
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {
    //cellタップ時に呼ばれるメソッドここは今までと変わらず
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
