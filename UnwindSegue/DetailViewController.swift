//
//  ViewController.swift
//  UnwindSegue
//
//  Created by nguyễn hữu đạt on 5/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailTextField: UITextField!
    
    var recieveData: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let data = recieveData {
            detailTextField.text = data
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard detailTextField.text != "" else {
            return
        }
        recieveData = detailTextField.text
    }
    

}

