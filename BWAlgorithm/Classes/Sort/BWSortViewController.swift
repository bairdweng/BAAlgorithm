//
//  BWSortViewController.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/15.
//

import UIKit

class BWSortViewController: UIViewController {
    let cellID = "sort_cell_id"
    
    let dataSources = [
        "insertSort",
        "shellSort",
        "bubbleSort",
        "selectionSort",
        "mergeSort"
    ]
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "sort"
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
extension BWSortViewController:UITableViewDelegate,UITableViewDataSource {
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
            BWInsertionSort().hello()
        case 1:
            BWShellSort().hello()
        case 2:
            BWBubbleSort().hello()
        case 3:
            BWSelectionSort().hello()
        case 4:
            BWMergeSort().hello()
        default: break
            
        }
    }
    
}
