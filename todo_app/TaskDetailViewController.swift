//
//  TaskDetailViewController.swift
//  todo_app
//
//  Created by tientran on 28/01/2021.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskDetailText : UILabel!
    
    var text : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDetailText.text = text
    }
    

}
