//
//  FiPageViewController.swift
//  Mastermind Game
//
//  Created by kin ming ching on 22/11/2021.
//

import UIKit

class FiPageViewController: UITableViewController {
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PlayBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    

}
