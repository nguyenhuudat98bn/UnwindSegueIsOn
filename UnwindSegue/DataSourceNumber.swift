//
//  DataSourceNumber.swift
//  UnwindSegue
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class DataSourceNumber: NSObject,UITableViewDataSource {
    
    var masterTableView: MasterTableViewController!
    var arrayNumber = [Int](1...5)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //        cell.textLabel?.text = String(arrayNumber[indexPath.row])
        cell.textLabel?.text = "\(arrayNumber[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayNumber.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterTableView.hasNoData = (arrayNumber.count == 0)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
