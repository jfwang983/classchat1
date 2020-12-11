//
//  ClassesViewController.swift
//  Class Chat
//
//  Created by Benjamin Garcia on 11/16/20.
//

import UIKit
import Parse

class ClassesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let scene = UIApplication.shared.connectedScenes.first
        if let delegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            delegate.window?.rootViewController = loginViewController
        }
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
