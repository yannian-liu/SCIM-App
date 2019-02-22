//
//  Admin3ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/24.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class Admin3ViewController: UIViewController {

    var userIDInput = String()
    var firstName = String ();
    var lastName = String ();
    var type = String ();
    
    
    @IBOutlet weak var Name_Label: UILabel!
    @IBOutlet weak var Logout_Label: UILabel!
    
    @IBOutlet weak var Logout_Button: UIButton!
    @IBAction func Logout_ButtonAction(_ sender: AnyObject) {
        LoginViewController.useridStandardUserDefaults.set("", forKey: "UserIDDefault")
        performSegue(withIdentifier: "LogoutAdmin_Segue", sender: self)
    }

    @IBOutlet weak var AutoLogin_Switch: UISwitch!
    @IBAction func AutoLogin_SwitchAction(_ sender: AnyObject) {
        if AutoLogin_Switch.isOn{
        } else {
            LoginViewController.useridStandardUserDefaults.set("", forKey: "UserIDDefault")
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(" ~~~~~ admin 3 ~~~~~")
        print("userIDInput in patient 4 is \(userIDInput)")
        print("firstName in patient 4 is \(firstName)")
        print("lastName in patient 4 is \(lastName)")
        print("type in patient 4 is \(type)")

        Name_Label.text = "\(firstName) \(lastName)";
        Logout_Label.text = "If you are not \(firstName) \(lastName), please logout."
        
        Logout_Button.layer.cornerRadius = 0.1 * Logout_Button.bounds.size.width
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
