//
//  ViewController.swift
//  todo_app
//
//  Created by tientran on 28/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var task = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate =  self
        tableView.dataSource = self
    }
    
    func handSaveData(text : String)  {
        task.append(text)
        tableView.reloadData()
    }
    
    @IBAction func addNewTaskButton(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(identifier: "addtask") as? AddTaskViewController else {return}
        vc.update = { text in
        
            DispatchQueue.main.async {
                self.handSaveData(text: text)
            }
        }
       
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(identifier: "taskdetail") as? TaskDetailViewController else {return}
        vc.text = task[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = task[indexPath.row]
        return cell
    }
}

