//
//  ViewController.swift
//  DiffableDataSource Demo
//
//  Created by Tai Chin Huang on 2022/10/4.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    enum Section {
        case first
    }
    
    struct Fruit: Hashable {
        let title: String
    }
    
    var fruits = [Fruit]() {
        didSet {
            updateDataSource()
        }
    }
    
    typealias DataSource = UITableViewDiffableDataSource<Section, Fruit>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>
    private lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = dataSource
//        tableView.backgroundColor = .black
        
        title = "My Fruit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }
    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Select fruit",
                                            message: nil,
                                            preferredStyle: .actionSheet)
        for x in 0...10 {
            actionSheet.addAction(UIAlertAction(title: "Fruit: \(x+1)", style: .default, handler: { [weak self] _ in
                
//                for i in 0..<self.fruits.count {
//                    if fruits[i].hashValue == 
//                }
                let fruit = Fruit(title: "Fruit \(x+1)")
                self?.fruits.append(fruit)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
    }
}

extension ViewController {
    func configureDataSource() -> DataSource {
        let dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = itemIdentifier.title
            
            return cell
        })
        return dataSource
    }
    
    func updateDataSource() {
        var snapshot = Snapshot()
        snapshot.appendSections([.first])
        snapshot.appendItems(fruits)
        
        dataSource.apply(snapshot)
    }
}

extension ViewController: UITableViewDelegate {
    
}
