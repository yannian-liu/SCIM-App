//
//  ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/1.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //static var userIDDefault = ""
    static var useridStandardUserDefaults = UserDefaults.standard
    
    var userIDInput = String();
    var firstName = String ();
    var lastName = String ();
    var type = String ();
    
    var Time = 5;
    var Timer = Foundation.Timer()
    
    @IBOutlet weak var Username_TextField: UITextField!
    
    @IBOutlet weak var PleaseEnter_Label: UILabel!
    @IBOutlet weak var WrongID_Label: UILabel!
    @IBOutlet weak var NetworkError_Label: UILabel!
    
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var Login_Button: UIButton!
    @IBAction func Login_ButtonAction(_ sender: AnyObject) {
        self.userIDInput = Username_TextField.text!

        //  *** input is empty ***
        if(userIDInput.isEmpty){
            self.PleaseEnter_Label.isHidden = false
            self.WrongID_Label.isHidden = true
            self.NetworkError_Label.isHidden = true
            self.myActivityIndicatorView.isHidden = true
        } else {

            getTypeAndSkip("http://localhost:8080/SCIM/Login", userIDInput: userIDInput)
        }
        
        
        LoginViewController.useridStandardUserDefaults.set(Username_TextField.text, forKey: "UserIDDefault")
  
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PleaseEnter_Label.isHidden = true
        self.WrongID_Label.isHidden = true
        self.NetworkError_Label.isHidden = true
        self.myActivityIndicatorView.isHidden = true
        Login_Button.layer.cornerRadius = 0.1 * Login_Button.bounds.size.width
        
        if let userIDStored = LoginViewController.useridStandardUserDefaults.string(forKey: "UserIDDefault") {
            Username_TextField.text = userIDStored
            self.userIDInput = userIDStored
            if userIDStored != ""{
                getTypeAndSkip("http://Localhost:8080/SCIM/Login", userIDInput: userIDInput)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // *** get the user's type and skip to patient view controller or admin view controller ***
    func getTypeAndSkip(_ urlString: String, userIDInput: String){
        self.myActivityIndicatorView.isHidden = false
        self.myActivityIndicatorView.startAnimating()
        self.Time = 5
        self.Timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(LoginViewController.TimeOut), userInfo: nil, repeats: true)
        
        
        
        self.WrongID_Label.isHidden = true
        self.PleaseEnter_Label.isHidden = true
        self.NetworkError_Label.isHidden = true

        print ("** Start func getTypeAndSkip **")
        let url = URL(string: urlString)
        
        
        let request = NSMutableURLRequest(url:url!);
        request.httpMethod = "POST";
        let postString = "userIDInput=\(userIDInput)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
           // let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            if error != nil
            {
                print("server is shut down")
                print("error=\(error)")
                OperationQueue.main.addOperation {
                    self.Timer.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    self.NetworkError_Label.isHidden = false
                    UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                        self.NetworkError_Label.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
                        }, completion: nil)
                }
                
                
                return
            }

            //print(" response = \(response)")

            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print(" responseString = \(responseString)")

            
            do {
                let myJSON = try JSONSerialization.jsonObject(with: data!, options:.mutableLeaves) as? NSDictionary
                print (myJSON)
                // *** This id is not exist ***
                if myJSON == [:]{
                     OperationQueue.main.addOperation {
                        self.Timer.invalidate()
                        self.myActivityIndicatorView.isHidden = true
                        self.WrongID_Label.isHidden = false
                        print ("id is wrong")
                        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                            self.WrongID_Label.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
                            }, completion: nil)
                    }
                    

                    
                    
                    
                } else {
                    
                    let parseJSON = myJSON
                    
                    var type_temp = parseJSON!["type"] as? String
                    var firstName_temp = parseJSON!["firstName"] as? String
                    var lastName_temp = parseJSON!["lastName"] as? String
                    
                    self.type = type_temp!
                    self.firstName = firstName_temp!
                    self.lastName = lastName_temp!
                    
                    if type_temp == "patient" {
                        print("get type: \(type_temp) & Skip To Patient VC \n ~~~~~~~~~~~~")
                        OperationQueue.main.addOperation{
                            self.Timer.invalidate()
                            self.myActivityIndicatorView.isHidden = true
                            self.performSegue(withIdentifier: "LoginPatient_Segue", sender: self)}
                    }
                        
                    else if type_temp == "admin" {
                        self.Timer.invalidate()
                        self.myActivityIndicatorView.isHidden = true
                        print("get type: \(type_temp) & Skip To Adin VC \n ~~~~~~~~~~~~")
                        OperationQueue.main.addOperation{
                            self.performSegue(withIdentifier: "LoginAdimin_Segue", sender: self)
                        }

                    }
               }

            } catch let error as NSError {
                
                //print(error.localizedDescription)
                
            }
        })
        
        task.resume()
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginPatient_Segue"{
            let tabBarController = segue.destination as! UITabBarController;
            
            let destinationViewController1 = tabBarController.childViewControllers[0] as! PatientItem1ViewController
            destinationViewController1.userIDInput = userIDInput;
            
            let destinationViewController2 = tabBarController.childViewControllers[1] as! PatientItem2ViewController
            destinationViewController2.userIDInput = userIDInput;
            
            let destinationViewController3 = tabBarController.childViewControllers[2].childViewControllers[0] as! PatientItem3ViewController
            destinationViewController3.userIDInput = userIDInput
            
            let destinationViewController4 = tabBarController.childViewControllers[3] as! PatientItem4ViewController
            destinationViewController4.userIDInput = userIDInput;
            destinationViewController4.firstName = firstName;
            destinationViewController4.lastName = lastName;
            destinationViewController4.type = type;
            

        } else {
            let tabBarController = segue.destination as! UITabBarController;
            let destinationViewController1 = tabBarController.childViewControllers[0].childViewControllers[0] as!Admin1ViewController
            destinationViewController1.userIDInput = userIDInput;
            
            
            let destinationViewController2 = tabBarController.childViewControllers[1].childViewControllers[0] as! Admin2ViewController
            destinationViewController2.userIDInput = userIDInput;
            
            
            let destinationViewController3 = tabBarController.childViewControllers[2].childViewControllers[0] as! Admin3ViewController
            destinationViewController3.userIDInput = userIDInput;
            destinationViewController3.firstName = firstName;
            destinationViewController3.lastName = lastName;
            destinationViewController3.type = type;
        }
   }
    
    func TimeOut (){
        Time -= 1
        print(Time)
        if (Time == 0){
            print("time <= 0 ~~")
            self.myActivityIndicatorView.isHidden = true
            self.NetworkError_Label.isHidden = false
            self.Timer.invalidate()
        }
        
    }

    
}

