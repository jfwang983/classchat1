//
//  CreateClassViewController.swift
//  Class Chat
//
//  Created by Angeli Faith Deanon on 12/10/20.
//

import UIKit
import Parse

class CreateClassViewController: UIViewController {
    @IBOutlet weak var titleClassTextField: UITextField!
    @IBOutlet weak var yourNameTextField: UITextField!
    @IBAction func cancelButtonIsPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createClassSubmit(_ sender: Any) {
        let classtype = PFObject(className: "Classes")
        
        classtype["classname"] = titleClassTextField.text
         classtype["teacher"] = yourNameTextField.text
         classtype["user"] = PFUser.current()!
         
         classtype.saveInBackground { (success, error) in
             if success{
                 self.dismiss(animated: true, completion: nil)
                 print ("saved!")
             }
             else {
                 print ("error!")
             }
         }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleClassTextField.returnKeyType = .done
        yourNameTextField.returnKeyType = .done
        


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
