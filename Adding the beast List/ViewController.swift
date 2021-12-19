//
//  ViewController.swift
//  Adding the beast List
//
//  Created by admin on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskInput: UITextField!
    @IBOutlet weak var taskListTable: UITableView!
    
    var tasks = ["call mam", "Read a book", "Do Housework"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        taskListTable.dataSource = self
      
    }
@IBAction func insertTaskButton(_ sender: UIButton) {
    guard let task = taskInput.text else { return  }
    if task.isEmpty {return}
            tasks.append(task)
            taskListTable.reloadData()
            taskInput.text = ""
}
}
extension ViewController : UITableViewDataSource {
    func tableView(_ taskListTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ taskListTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskListTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
}
