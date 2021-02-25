//
//  TableTableViewController.swift
//  Project4
//
//  Created by Alexander Filippov on 25.2.21..
//  Copyright © 2021 Alexander Filippov. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    var websites = ["hackingwithswift.com", "apple.com", "raywenderlich.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Web Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Browser", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "WebBrowser") as? ViewController {
            vc.websites = websites
            vc.selectedWebsite = websites[indexPath.row]
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            navigationController?.pushViewController(vc, animated: true)        }
    }
    


}
