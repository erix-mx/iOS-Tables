//
//  ViewController.swift
//  First List
//
//  Created by Erix on 27/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Naruto service
    let narutoManager = NarutoManager()
    var characterList: [NarutoModel] = []
    var selectedCharacter: NarutoModel? = nil
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    //MARK: - Tab ref
    
    @IBOutlet weak var tableView: UITableView!
    
    /*
        1.- To implement DataSource with a protocol
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        tableView.delegate = self
        
        narutoManager.delegate = self
        narutoManager.fetchService()
        loader.hidesWhenStopped = true
        loader.startAnimating()
    }
    
}

extension ViewController: NarutoManagerDelegate {
    func didError(error: String?) {
        print(error ?? "Unknown error!")
        DispatchQueue.main.async {
            self.loader.stopAnimating()
        }
    }
    
    func didSuccess(character: [NarutoModel]) {
        characterList = character
        print(character)
        tableView.reloadData()
        DispatchQueue.main.async {
            self.loader.stopAnimating()
        }
    }
    
    
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let destination = segue.destination as! DetailViewController
            if let selectedCharacter = selectedCharacter {
                destination.imageUrl = selectedCharacter.urlImage ?? ""
                destination.itemName = selectedCharacter.name  ?? ""
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    //number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    //Show items
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath)
        let currentItem = characterList[indexPath.row]
        (cell as? ItemTableViewCell)?.setupCell(
            username:currentItem.name ?? "Unknown",
            urlImage: currentItem.urlImage ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
        )
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCharacter = characterList[indexPath.row]
        performSegue(withIdentifier: "detail", sender: self)
    }
}

