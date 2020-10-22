//
//  BWBinaryTreeSearchViewController.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/12.
//

import UIKit

class BWBinaryTreeSearchViewController: UIViewController {
    let cellID = "binary_search_tree_cell_id"
    
    let dataSources = [
        "insert",
        "delete",
        "find",
        "preEach",
        "inEach",
        "lastEach",
        "resetFake",
        "isvalidFake",
        "isValid",
        "isInBST",
        "printHeight"
    ]
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    let example = BWBinarySearchTreeExample()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "binary search tree"
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
extension BWBinaryTreeSearchViewController:UITableViewDelegate,UITableViewDataSource {
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
            example.clean()
            for i in 1...10 {
                example.insert(data: i)
            }
        case 1:
            example.delete()
        case 2:
            example.find()
        case 3:
            example.printPre()
        case 4:
            example.printIn()
        case 5:
            example.printLast()
        case 6:
            example.resetFakeBST()
        case 7:
            example.isValidFake()
        case 8:
            example.isValid()
        case 9:
            example.isInBST()
        case 10:
            example.printTreeHeight()
        default: break
        }
    }
    
}
