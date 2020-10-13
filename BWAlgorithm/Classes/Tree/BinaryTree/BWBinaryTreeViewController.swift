//
//  BWBinaryTreeViewController.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/12.
//

import UIKit

class BWBinaryTreeViewController: UIViewController {
    let cellID = "binary_tree_cell_id"
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    let binaryTree = BWBinaryTreeExample()
    
    let dataSources = [
        "Create Node",
        "Print Values",
        "preOrderPrint",
        "inOrderPrint",
        "postOrderPrint",
        "leveOrderPrint",
        "printTreeHeight"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "binary tree"
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BWBinaryTreeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataSources.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let title = dataSources[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            binaryTree.createTree()
        case 1:
            binaryTree.print()
        case 2:
            binaryTree.preOrderPrint()
        case 3:
            binaryTree.inOrderPrint()
        case 4:
            binaryTree.postOrderPrint()
        case 5:
            binaryTree.levelOrderPrint()
        case 6:
            binaryTree.printTreeHeight()
        default:
            break
        }
    }
}
