//
//  CreateClassViewController.swift
//  Class Chat
//
//  Created by Angeli Faith Deanon on 12/10/20.
//

import UIKit

class CreateClassViewController: UIViewController {
    @IBOutlet weak var titleClassTextField: UITextField!
    @IBOutlet weak var yourNameTextField: UITextField!
    @IBAction func cancelButtonIsPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createClassSubmit(_ sender: Any) {
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
