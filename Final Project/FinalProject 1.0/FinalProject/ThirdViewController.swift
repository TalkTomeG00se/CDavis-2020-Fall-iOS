//
//  ThirdViewController.swift
//  FinalProject
//
//  Created by Colten Davis on 12/9/20.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var cryptItems = [Crypt]()
    
    var moc:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        
        self.tableView.dataSource = self
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData(){
        
        let cryptRequest:NSFetchRequest<Crypt> = Crypt.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "type", ascending: false)
        
        try? cryptItems = moc.fetch(cryptRequest)
        
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        let encryptItem = cryptItems[indexPath.row]
        
        let cellTitle = encryptItem.type
        
        cell.textLabel?.text = cellTitle
        
        let cellOriginalText = encryptItem.input
        
        let cellOutputText = encryptItem.output
        
        cell.detailTextLabel?.text = "Original text: \(cellOriginalText) Output: \(cellOutputText)"
        
        return cell
    }
}
