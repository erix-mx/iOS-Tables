//
//  ViewController.swift
//  First List
//
//  Created by Erix on 27/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Tab ref
    
    @IBOutlet weak var tableView: UITableView!
    
    /*
        1.- To implement DataSource with a protocol
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell-sample-id")
        tableView.delegate = self
    }
    
}

extension ViewController: UITableViewDataSource {
    //number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //Show items
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-sample-id", for: indexPath)
        cell.textLabel?.text = "I'm cell number \(indexPath)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click in \(indexPath)")
    }
}

