//
//  PatientItem2ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/7.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class PatientItem2ViewController: UIViewController {
    
    var result :[Int] = [11,11,11,11]
    var Empty_Array = [Int]()
    
    var userIDInput = String();
    
    
    
    @IBOutlet weak var SubmitQofL_Button: UIButton!
    
    
    @IBOutlet weak var Q1A0_Button: UIButton!
    @IBOutlet weak var Q1A1_Button: UIButton!
    @IBOutlet weak var Q1A2_Button: UIButton!
    @IBOutlet weak var Q1A3_Button: UIButton!
    @IBOutlet weak var Q1A4_Button: UIButton!
    @IBOutlet weak var Q1A5_Button: UIButton!
    @IBOutlet weak var Q1A6_Button: UIButton!
    @IBOutlet weak var Q1A7_Button: UIButton!
    @IBOutlet weak var Q1A8_Button: UIButton!
    @IBOutlet weak var Q1A9_Button: UIButton!
    @IBOutlet weak var Q1A10_Button: UIButton!
    @IBOutlet weak var Q2A0_Button: UIButton!
    @IBOutlet weak var Q2A1_Button: UIButton!
    @IBOutlet weak var Q2A2_Button: UIButton!
    @IBOutlet weak var Q2A3_Button: UIButton!
    @IBOutlet weak var Q2A4_Button: UIButton!
    @IBOutlet weak var Q2A5_Button: UIButton!
    @IBOutlet weak var Q2A6_Button: UIButton!
    @IBOutlet weak var Q2A7_Button: UIButton!
    @IBOutlet weak var Q2A8_Button: UIButton!
    @IBOutlet weak var Q2A9_Button: UIButton!
    @IBOutlet weak var Q2A10_Button: UIButton!
    @IBOutlet weak var Q3A0_Button: UIButton!
    @IBOutlet weak var Q3A1_Button: UIButton!
    @IBOutlet weak var Q3A2_Button: UIButton!
    @IBOutlet weak var Q3A3_Button: UIButton!
    @IBOutlet weak var Q3A4_Button: UIButton!
    @IBOutlet weak var Q3A5_Button: UIButton!
    @IBOutlet weak var Q3A6_Button: UIButton!
    @IBOutlet weak var Q3A7_Button: UIButton!
    @IBOutlet weak var Q3A8_Button: UIButton!
    @IBOutlet weak var Q3A9_Button: UIButton!
    @IBOutlet weak var Q3A10_Button: UIButton!
    

    @IBAction func Q1A0_ButtonAction(_ sender: AnyObject) {
        result[1] = 0;
        selectQ1Answer(Q1A0_Button)
    }
    @IBAction func Q1A1_ButtonAction(_ sender: AnyObject) {
        result[1] = 1;
        selectQ1Answer(Q1A1_Button)
    }
    @IBAction func Q1A2_ButtonAction(_ sender: AnyObject) {
        result[1] = 2;
        selectQ1Answer(Q1A2_Button)
    }
    @IBAction func Q1A3_ButtonAction(_ sender: AnyObject) {
        result[1] = 3;
        selectQ1Answer(Q1A3_Button)
    }
    @IBAction func Q1A4_ButtonAction(_ sender: AnyObject) {
        result[1] = 4;
        selectQ1Answer(Q1A4_Button)
    }
    @IBAction func Q1A5_ButtonAction(_ sender: AnyObject) {
        result[1] = 5;
        selectQ1Answer(Q1A5_Button)
    }
    @IBAction func Q1A6_ButtonAction(_ sender: AnyObject) {
        result[1] = 6;
        selectQ1Answer(Q1A6_Button)
    }
    @IBAction func Q1A7_ButtonAction(_ sender: AnyObject) {
        result[1] = 7;
        selectQ1Answer(Q1A7_Button)
    }
    @IBAction func Q1A8_ButtonAction(_ sender: AnyObject) {
        result[1] = 8;
        selectQ1Answer(Q1A8_Button)
    }
    @IBAction func Q1A9_ButtonAction(_ sender: AnyObject) {
        result[1] = 9;
        selectQ1Answer(Q1A9_Button)
    }
    @IBAction func Q1A10_ButtonAction(_ sender: AnyObject) {
        result[1] = 10;
        selectQ1Answer(Q1A10_Button)
    }
    @IBAction func Q2A0_ButtonAction(_ sender: AnyObject) {
        result[2] = 0;
        selectQ2Answer(Q2A0_Button)
    }
    @IBAction func Q2A1_ButtonAction(_ sender: AnyObject) {
        result[2] = 1;
        selectQ2Answer(Q2A1_Button)
    }
    @IBAction func Q2A2_ButtonAction(_ sender: AnyObject) {
        result[2] = 2;
        selectQ2Answer(Q2A2_Button)
    }
    @IBAction func Q2A3_ButtonAction(_ sender: AnyObject) {
        result[2] = 3;
        selectQ2Answer(Q2A3_Button)
    }
    @IBAction func Q2A4_ButtonAction(_ sender: AnyObject) {
        result[2] = 4;
        selectQ2Answer(Q2A4_Button)
    }
    @IBAction func Q2A5_ButtonAction(_ sender: AnyObject) {
        result[2] = 5;
        selectQ2Answer(Q2A5_Button)
    }
    @IBAction func Q2A6_ButtonAction(_ sender: AnyObject) {
        result[2] = 6;
        selectQ2Answer(Q2A6_Button)
    }
    @IBAction func Q2A7_ButtonAction(_ sender: AnyObject) {
        result[2] = 7;
        selectQ2Answer(Q2A7_Button)
    }
    @IBAction func Q2A8_ButtonAction(_ sender: AnyObject) {
        result[2] = 8;
        selectQ2Answer(Q2A8_Button)
    }
    @IBAction func Q2A9_ButtonAction(_ sender: AnyObject) {
        result[2] = 9;
        selectQ2Answer(Q2A9_Button)
    }
    @IBAction func Q2A10_ButtonAction(_ sender: AnyObject) {
        result[2] = 10;
        selectQ2Answer(Q2A10_Button)
    }
    @IBAction func Q3A0_ButtonAction(_ sender: AnyObject) {
        result[3] = 0;
        selectQ3Answer(Q3A0_Button)
    }
    @IBAction func Q3A1_ButtonAction(_ sender: AnyObject) {
        result[3] = 1;
        selectQ3Answer(Q3A1_Button)
    }
    @IBAction func Q3A2_ButtonAction(_ sender: AnyObject) {
        result[3] = 2;
        selectQ3Answer(Q3A2_Button)
    }
    @IBAction func Q3A3_ButtonAction(_ sender: AnyObject) {
        result[3] = 3;
        selectQ3Answer(Q3A3_Button)
    }
    @IBAction func Q3A4_ButtonAction(_ sender: AnyObject) {
        result[3] = 4;
        selectQ3Answer(Q3A4_Button)
    }
    @IBAction func Q3A5_ButtonAction(_ sender: AnyObject) {
        result[3] = 5;
        selectQ3Answer(Q3A5_Button)
    }
    @IBAction func Q3A6_ButtonAction(_ sender: AnyObject) {
        result[3] = 6;
        selectQ3Answer(Q3A6_Button)
    }
    @IBAction func Q3A7_ButtonAction(_ sender: AnyObject) {
        result[3] = 7;
        selectQ3Answer(Q3A7_Button)
    }
    @IBAction func Q3A8_ButtonAction(_ sender: AnyObject) {
        result[3] = 8;
        selectQ3Answer(Q3A8_Button)
    }
    @IBAction func Q3A9_ButtonAction(_ sender: AnyObject) {
        result[3] = 9;
        selectQ3Answer(Q3A9_Button)
    }
    @IBAction func Q3A10_ButtonAction(_ sender: AnyObject) {
        result[3] = 10;
        selectQ3Answer(Q3A10_Button)
    }


    var Time = 5;
    var Timer = Foundation.Timer()
    
    
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        print("Patient 2 userIDInput : \(userIDInput)")
        
        setButtonInitial(Q1A0_Button)
        setButtonInitial(Q1A1_Button)
        setButtonInitial(Q1A2_Button)
        setButtonInitial(Q1A3_Button)
        setButtonInitial(Q1A4_Button)
        setButtonInitial(Q1A5_Button)
        setButtonInitial(Q1A6_Button)
        setButtonInitial(Q1A7_Button)
        setButtonInitial(Q1A8_Button)
        setButtonInitial(Q1A9_Button)
        setButtonInitial(Q1A10_Button)
        setButtonInitial(Q2A0_Button)
        setButtonInitial(Q2A1_Button)
        setButtonInitial(Q2A2_Button)
        setButtonInitial(Q2A3_Button)
        setButtonInitial(Q2A4_Button)
        setButtonInitial(Q2A5_Button)
        setButtonInitial(Q2A6_Button)
        setButtonInitial(Q2A7_Button)
        setButtonInitial(Q2A8_Button)
        setButtonInitial(Q2A9_Button)
        setButtonInitial(Q2A10_Button)
        setButtonInitial(Q3A0_Button)
        setButtonInitial(Q3A1_Button)
        setButtonInitial(Q3A2_Button)
        setButtonInitial(Q3A3_Button)
        setButtonInitial(Q3A4_Button)
        setButtonInitial(Q3A5_Button)
        setButtonInitial(Q3A6_Button)
        setButtonInitial(Q3A7_Button)
        setButtonInitial(Q3A8_Button)
        setButtonInitial(Q3A9_Button)
        setButtonInitial(Q3A10_Button)
        
        SubmitQofL_Button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        SubmitQofL_Button.layer.cornerRadius = 0.1 * SubmitQofL_Button.bounds.size.width

        self.myActivityIndicatorView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonInitial(_ button: UIButton)
    {
//        button.titleLabel?.textColor = UIColor(red:0.0/255.0, green:122.0/255.0, blue:255.0/255.0, alpha:1).CGColor as CGColorRef
        button.setTitleColor(UIColor.black, for: UIControlState())
        
//        button.layer.backgroundColor = UIColor.(red:0.0/255.0, green:122.0/255.0, blue:255.0/255.0, alpha:1).CGColor as CGColorRef
        button.backgroundColor = UIColor.white
        
        button.layer.borderColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 0.1 * button.bounds.size.width
        button.clipsToBounds = true
    }
    

    func selectQ1Answer (_ button:UIButton){
        if (button.backgroundColor == UIColor.white){
            Q1A0_Button.backgroundColor = UIColor.white
            Q1A1_Button.backgroundColor = UIColor.white
            Q1A2_Button.backgroundColor = UIColor.white
            Q1A3_Button.backgroundColor = UIColor.white
            Q1A4_Button.backgroundColor = UIColor.white
            Q1A5_Button.backgroundColor = UIColor.white
            Q1A6_Button.backgroundColor = UIColor.white
            Q1A7_Button.backgroundColor = UIColor.white
            Q1A8_Button.backgroundColor = UIColor.white
            Q1A9_Button.backgroundColor = UIColor.white
            Q1A10_Button.backgroundColor = UIColor.white
            
        
        button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:0.5).cgColor as CGColor
        }else{
            setButtonInitial(button)
            result[1] = 11;
        }
    }
    
    func selectQ2Answer (_ button:UIButton){
        if (button.backgroundColor == UIColor.white){
            Q2A0_Button.backgroundColor = UIColor.white
            Q2A1_Button.backgroundColor = UIColor.white
            Q2A2_Button.backgroundColor = UIColor.white
            Q2A3_Button.backgroundColor = UIColor.white
            Q2A4_Button.backgroundColor = UIColor.white
            Q2A5_Button.backgroundColor = UIColor.white
            Q2A6_Button.backgroundColor = UIColor.white
            Q2A7_Button.backgroundColor = UIColor.white
            Q2A8_Button.backgroundColor = UIColor.white
            Q2A9_Button.backgroundColor = UIColor.white
            Q2A10_Button.backgroundColor = UIColor.white
        
        button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:0.5).cgColor as CGColor
        } else {
            setButtonInitial(button)
            result[2] = 11;
        }
    }
    
    func selectQ3Answer (_ button:UIButton){
        if (button.backgroundColor == UIColor.white){
            Q3A0_Button.backgroundColor = UIColor.white
            Q3A1_Button.backgroundColor = UIColor.white
            Q3A2_Button.backgroundColor = UIColor.white
            Q3A3_Button.backgroundColor = UIColor.white
            Q3A4_Button.backgroundColor = UIColor.white
            Q3A5_Button.backgroundColor = UIColor.white
            Q3A6_Button.backgroundColor = UIColor.white
            Q3A7_Button.backgroundColor = UIColor.white
            Q3A8_Button.backgroundColor = UIColor.white
            Q3A9_Button.backgroundColor = UIColor.white
            Q3A10_Button.backgroundColor = UIColor.white
        
        button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:0.5).cgColor as CGColor
        } else {
            setButtonInitial(button)
            result[3] = 11;
        }
    }
        
    
    @IBAction func SubmitQofL_ButtonAction(_ sender: AnyObject) {
        print (result)
        let date = Date();
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        let defaultTimeZoneStr = formatter.string(from: date);
        let timestamp = formatter.string(from: date);
        print("submit time : \(timestamp)")
        
        for i in 1...3 {
        //for var i = 1; i <= 3; i += 1 {
            if (result[i]==11){
                Empty_Array.append(i)
            }
        }
        if (Empty_Array.count == 0){

            submitQualityOfLife("http://localhost:8080/SCIM/SubmitQualityOfLife",timestamp: timestamp, userIDInput: userIDInput,result:result);

        } else {
            var Message_String = "";
            if (Empty_Array.count == 1){
                Message_String = "You didn't answer the Question of"
            } else {
                Message_String = "You didn't answer the Questions of"
            }
            
            for i in 0 ..< Empty_Array.count {
                Message_String = "\(Message_String) \(Empty_Array[i])"
            }
            
            let alertOfEmpty_Alert = UIAlertController (title: "Oops!", message: Message_String,preferredStyle: UIAlertControllerStyle.alert)
            let OkeyButton_AlertAction = UIAlertAction (title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            let ContinueButton_AlertAction = UIAlertAction (title: "Continue", style:UIAlertActionStyle.default){(action: UIAlertAction) -> Void in
                self.submitQualityOfLife("http://localhost:8080/SCIM/SubmitQualityOfLife",timestamp: timestamp, userIDInput: self.userIDInput,result:self.result);
                print("continue to submit")
            }
            
           
            
            alertOfEmpty_Alert.addAction(OkeyButton_AlertAction)
            alertOfEmpty_Alert.addAction(ContinueButton_AlertAction)
            present(alertOfEmpty_Alert, animated:true, completion: nil)
        }
        
         print("Empty_Array: \(Empty_Array)")
         Empty_Array = [];

    }
    
    
    
    func submitQualityOfLife (_ urlString: String, timestamp: String, userIDInput: String, result: [Int]){
        print ("** Start func submitQualityOfLife **")
        
        self.myActivityIndicatorView.isHidden = false
        self.myActivityIndicatorView.startAnimating()
        self.Time = 5
        self.Timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PatientItem2ViewController.TimeOut), userInfo: nil, repeats: true)
        
        let url = URL(string: urlString)
        
        
        let request = NSMutableURLRequest(url:url!);
        request.httpMethod = "POST";
        let postString = "timestamp=\(timestamp)&userIDInput=\(userIDInput)&Q1AnsInput=\(result[1])&Q2AnsInput=\(result[2])&Q3AnsInput=\(result[3])";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        print(postString)
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            // let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            if error != nil
            {
                print("error=\(error)")
                OperationQueue.main.addOperation {
                    self.Timer.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
                }
                return
            }
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            do {
                if responseString == "insert secessfully"{
                    DispatchQueue.main.async(execute: {
                        self.Timer.invalidate()
                        self.myActivityIndicatorView.isHidden = true
                        self.showCancelAlert("Submitting Sucessfully", message_p: "",actionTitle_p: "Ok")
                    })
                }
                
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            

        })
        
        task.resume()
    }

    func showCancelAlert (_ title_p:String, message_p:String, actionTitle_p: String) {
        let ok_Alert = UIAlertController (title: title_p, message: message_p, preferredStyle: UIAlertControllerStyle.alert)
        let OkeyButton_AlertAction = UIAlertAction (title: actionTitle_p, style:UIAlertActionStyle.cancel, handler: nil)
        ok_Alert.addAction(OkeyButton_AlertAction)
        present(ok_Alert, animated:true, completion: nil)
        
    }
    func TimeOut (){
        Time -= 1
        print(Time)
        if (Time == 0){
            print("time <= 0 ~~")
            self.myActivityIndicatorView.isHidden = true
            self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
            self.Timer.invalidate()
            
        }
        
    }

    
}
