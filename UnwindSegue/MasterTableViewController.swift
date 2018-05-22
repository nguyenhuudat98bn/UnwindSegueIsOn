//
//  MasterTableViewController.swift
//  UnwindSegue
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    @IBOutlet weak var switchOn: UISwitch!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    var hasNoData: Bool = false {
        didSet {
            hasNoData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = footerView)
        }
    }
    var dataSourceNumber = DataSourceNumber()
    var dataSourceString = DataSourceString()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSourceNumber
        dataSourceString.masterTableView = self
        dataSourceNumber.masterTableView = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switchOn.isOn ? (hasNoData = (dataSourceNumber.arrayNumber.count == 0)) : (hasNoData = dataSourceString.arrayString.count == 0)
    }
    @IBAction func changeState(_ sender : UISwitch) {
        sender.isOn ? (tableView.dataSource = dataSourceNumber) : (tableView.dataSource = dataSourceString)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            guard let detailViewController = segue.destination as? DetailViewController else {return}
            guard let index = tableView.indexPathForSelectedRow else {return}
            switchOn.isOn ? (detailViewController.recieveData = String(dataSourceNumber.arrayNumber[index.row])) : (detailViewController.recieveData = dataSourceString.arrayString[index.row])
        }
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if let detailViewController = segue.source as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                switchOn.isOn ? (dataSourceNumber.arrayNumber[indexPath.row] = Int(detailViewController.recieveData ?? "") ?? 0) : (dataSourceString.arrayString[indexPath.row] = detailViewController.recieveData ?? "")
            } else {
                switchOn.isOn ? (dataSourceNumber.arrayNumber.append(Int(detailViewController.recieveData ?? "") ?? 0)) : (dataSourceString.arrayString.append(detailViewController.recieveData ?? ""))
            }
        }
        tableView.reloadData()
    }
    
   
}
