//
//  AddTaskViewController.swift
//  todo_app
//
//  Created by tientran on 28/01/2021.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var update : ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleAddTask))
    }
    
    @objc func handleAddTask(){
        let text =  textField.text!
        
        if !text.isEmpty {
            self.update?(text)
            navigationController?.popViewController(animated: true)
        }
         
        let alert = UIAlertController(title: "Error", message: "Text input not empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
                    
        
    }
    
}

extension AddTaskViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
