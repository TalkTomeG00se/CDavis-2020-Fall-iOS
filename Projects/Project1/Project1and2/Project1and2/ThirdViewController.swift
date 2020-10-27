//
//  ThirdViewController.swift
//  Project1and2
//
//  Created by Colten Davis on 10/26/20.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var workoutItems = [Workout]()
    
    var moc:NSManagedObjectContext!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        
        self.tableView.dataSource = self
        
        loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        let workoutRequest:NSFetchRequest<Workout> = Workout.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "added", ascending: false)
        
        workoutRequest.sortDescriptors = [sortDescriptor]
        
        do{
            
            try workoutItems = moc.fetch(workoutRequest)
        } catch {
            
            print("Could not load data")
        }
        
        self.tableView.reloadData()
    }
    

    @IBAction func workoutButtonPressed(_ sender: UIButton) {
        
        let workoutItem = Workout(context: moc)
        
        workoutItem.added = NSDate() as Date
        
        if sender.tag == 0 {
            
            workoutItem.type = "Worked Out, Whoo!"
        } else {
            
            workoutItem.type = "Skipped Work Out, Lazy!"
        }
        
        appDelegate?.saveContext()
        
        loadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return workoutItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let workoutItem = workoutItems[indexPath.row]
        
        let workoutType = workoutItem.type
        
        cell.textLabel?.text = workoutType
        
        let workoutDate = workoutItem.added!
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM d YYYY, hh:mm"
        
        cell.detailTextLabel?.text = dateFormatter.string(from: workoutDate)
        
        return cell
    }

}
