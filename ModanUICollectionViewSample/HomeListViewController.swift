//
//  HomeListViewController.swift
//  ModanUICollectionViewSample
//
//  Created by Satoshi Komatsu on 2023/10/07.
//

import UIKit

final class HomeListViewController: UIViewController {

    enum Section {
        case main
    }

    lazy var collectionView: UICollectionView = {
        let c = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout())
        c.delegate = self
        return c
    }()
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, Scene> = createDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "タイトル"
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateUI()
    }
}

extension HomeListViewController {
    private func collectionViewLayout() -> UICollectionViewLayout {
        // UICollectionViewListを使用する。
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension HomeListViewController {

    private func createDataSource() -> UICollectionViewDiffableDataSource<Section, Scene> {
        let celRRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Scene> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item.rawValue
            cell.contentConfiguration = content
        }

        return UICollectionViewDiffableDataSource<Section, Scene>(collectionView: collectionView) { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: celRRegistration, for: indexPath, item: identifier)
        }
    }

    func updateUI() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Scene>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Scene.allCases)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension HomeListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // TODO: better use safe index
//        guard let vc = Scene.allCases[safe: indexPath.row]?.vc else { return }
        let vc = Scene.allCases[indexPath.row].vc

        navigationController?.pushViewController(vc, animated: true)
    }
}

