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

    lazy var collectionView: UICollectionView = {
        let c = UICollectionView(frame: view.bounds, collectionViewLayout: createView())
        c.delegate = self
        return c
    }()
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, Int> = createDataSource()

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddViewController" {
            let addViewController = segue.destination as! AddViewController
            addViewController.close = {
                print("called")
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController {
    private func createView() -> UICollectionViewLayout {
        // UICollectionViewListを使用する。
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension ViewController {

    private func createDataSource() -> UICollectionViewDiffableDataSource<Section, Int> {
        let celRRegistration = UICollectionView.CellRegistration<CustomCell, Int> { (cell, indexPath, item) in
            cell.title.text = String(indexPath.row)
        }

        return UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: celRRegistration, for: indexPath, item: identifier)
        }
    }

    func updateUI() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<12))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
