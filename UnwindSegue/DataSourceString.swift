//
//  DataSourceString.swift
//  UnwindSegue
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class DataSourceString: NSObject,UITableViewDataSource {
    
    var masterTableView: MasterTableViewController!
    var arrayString = ["Nhat","Nhi","Tam","Tu"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayString[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterTableView.hasNoData = (arrayString.count == 0)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}

