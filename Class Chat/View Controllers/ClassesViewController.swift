//
//  ClassesViewController.swift
//  Class Chat
//
//  Created by Benjamin Garcia on 11/16/20.
//

import UIKit
import Parse

class ClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var classTableView: UITableView!
    
    var classes = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return classes.count

    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell") as! ClassCell
        
        let classtype = classes[indexPath.row]
        
        
        cell.teacherName.text = classtype["teacher"] as? String
        cell.className.text = classtype["classname"] as? String
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classTableView.delegate = self
        classTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Classes")
        query.includeKeys(["teacher", "classname"])
        query.limit = 20
        
        query.findObjectsInBackground { (classes, error) in
            if classes != nil{
                self.classes = classes!
                self.classTableView.reloadData()
            }
        }
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
