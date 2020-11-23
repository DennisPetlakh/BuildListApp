//
//  ViewController.swift
//  BuildListApp
//
//  Created by Dennis Petlakh on 10/1/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, list:String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "BuildList"
    }
    
    @IBAction func didTapeNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else{
            return
        }
        vc.title = "New List"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { listTitle, list in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: listTitle, list: list))
            self.label.isHidden = true
            self.table.isHidden = false

            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    // Create the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].list
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        // Show BuildList Controller
        guard let vc = storyboard?.instantiateViewController(identifier: "buildList") as? BuildListViewController else {
            return
        }
        
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "BuildList"
        vc.listTitle = model.title
        vc.list = model.list
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
