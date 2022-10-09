//
//  BannerCollectionViewController.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/5.
//

import UIKit

class BannerCollectionViewController: UIViewController {
    
    enum SectionItem: Hashable {
        case layoutType(LayoutType)
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, SectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, SectionItem>
    
    private lazy var dataSource = configureDataSource()
    
    private lazy var collectionView: UICollectionView = {
        //* //
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        // */ let collectionView = UICollectionView()
        
        collectionView.delegate = self
        collectionView.register(LayoutTypeCell.self,
                                forCellWithReuseIdentifier: LayoutTypeCell.reuseIdentifier)
        collectionView.register(PagingSectionFooterView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: PagingSectionFooterView.reuseIdentifier)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Modern Collection View"
        configureCollectionView()
        udpateSnapshot()
    }
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = dataSource
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
// MARK: - internal functions
extension BannerCollectionViewController {
    func configureDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return self.cell(collectionView: collectionView, indexPath: indexPath, item: itemIdentifier)
        }
        return dataSource
    }
    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: SectionItem) -> UICollectionViewCell {
        switch item {
            
        case .layoutType(let layoutType):
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: LayoutTypeCell.reuseIdentifier, for: indexPath) as! LayoutTypeCell
            item.configure(with: layoutType)
            return item
        }
    }
    func udpateSnapshot(animated: Bool = false) {
        var snapshot = Snapshot()
        
        var sections = [Int]()
        
        for i in 0...Int.random(in: 3...5) {
            sections.append(i)
        }
        
        snapshot.appendSections(sections)
        snapshot.appendItems(LayoutType.available.map(SectionItem.layoutType), toSection: sections.first)
        
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.32))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                heightDimension: .absolute(20))
//        let pagingFooterElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,
//                                                                     elementKind: UICollectionView.elementKindSectionFooter,
//                                                                     alignment: .bottom)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
//        section.boundarySupplementaryItems += [pagingFooterElement]
//        section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) in
//            guard let self = self else { return }
//            let page = round(offset.x / self.view.bounds.width)
//            
//        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
extension BannerCollectionViewController {
    
    
    
}
// MARK: - CollectionView
extension BannerCollectionViewController: UICollectionViewDelegate {
    
}
