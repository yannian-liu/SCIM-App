//
//  PatientItem4ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/14.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class PatientItem4ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //static var notiDefault = false
    static var notiStandardUserDefaults = UserDefaults.standard
    
    
    var userIDInput = String()
    var firstName = String ();
    var lastName = String ();
    var type = String ();
    
    var Day_Array = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]
    var Day_String = "1";
    var Time_String = "";

    var Time = 7;
    var Timer = Foundation.Timer()
    
    @IBOutlet weak var Name_Label: UILabel!
    @IBOutlet weak var Logout_Label: UILabel!
    
    @IBOutlet weak var Logout_Button: UIButton!

    @IBAction func Logout_ButtonAction(_ sender: AnyObject) {
        LoginViewController.useridStandardUserDefaults.set("", forKey: "UserIDDefault")
        UIApplication.shared.cancelAllLocalNotifications()
        performSegue(withIdentifier: "Logout_Segue", sender: self)
        
    }
    
    @IBOutlet weak var AutoLogin_Switch: UISwitch!
    @IBAction func AutoLogin_SwitchAction(_ sender: AnyObject) {
        if AutoLogin_Switch.isOn{
            Notification_Switch.isEnabled = true
        } else {
            LoginViewController.useridStandardUserDefaults.set("", forKey: "UserIDDefault")
            
            Notification_Switch.setOn(false, animated: true)
            Notification_Switch.isEnabled = false
            UIApplication.shared.cancelAllLocalNotifications()
            PatientItem4ViewController.notiStandardUserDefaults.set(false, forKey: "NotiSwitchState")

        }
    }
    
    
    @IBOutlet weak var Day_PickerView: UIPickerView!
    @IBOutlet weak var Time_DatePicker: UIDatePicker!
        
    @IBAction func Time_DatePickerAction(_ sender: AnyObject) {
        
        let TimeFormatter = DateFormatter();
        TimeFormatter.dateFormat = "h:mm a"
        let SelectedTime_String = TimeFormatter.string(from: Time_DatePicker.date)
        self.Time_Button.setTitle(SelectedTime_String, for: UIControlState())
        self.Time_String = SelectedTime_String
        
    }
    

    
    
    @IBOutlet weak var Day_Button: UIButton!
    @IBAction func Day_ButtonAction(_ sender: AnyObject) {
        if self.Day_PickerView.isHidden == false{
            self.Day_PickerView.isHidden = true
        }else{
            self.Day_PickerView.isHidden = false
        }
        if self.Time_DatePicker.isHidden == false{
            self.Time_DatePicker.isHidden = true
        }
        
        
    }
    
    @IBOutlet weak var Time_Button: UIButton!
    @IBAction func Time_ButtonAction(_ sender: AnyObject) {
        if self.Time_DatePicker.isHidden == false{
            self.Time_DatePicker.isHidden = true
        }
        else{
            self.Time_DatePicker.isHidden = false
        }
        if self.Day_PickerView.isHidden == false{
            self.Day_PickerView.isHidden = true
        }
    }
    
    @IBOutlet weak var Notification_Switch: UISwitch!
    @IBAction func Notification_SwitchAction(_ sender: AnyObject) {
        let TimeFormatter = DateFormatter();
        TimeFormatter.dateFormat = "h:mm a"
        let PickedTime_Date = TimeFormatter.date(from: self.Time_String)
        
        let HourFormatter = DateFormatter();
        HourFormatter.dateFormat = "HH"
        let selectedHour = Int(HourFormatter.string(from: PickedTime_Date!))
        
        let MinuteFormatter = DateFormatter();
        MinuteFormatter.dateFormat = "mm"
        let selectedMinute = Int(MinuteFormatter.string(from: PickedTime_Date!))
        
        
        if Notification_Switch.isOn {
            print("on")
            
            let calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
            var dateFire = Date()
            
            var fireComponents=(calendar as NSCalendar).components([NSCalendar.Unit.day,NSCalendar.Unit.month,NSCalendar.Unit.year,NSCalendar.Unit.hour,NSCalendar.Unit.minute], from:dateFire)
            print(fireComponents.hour)
            if (fireComponents.hour > selectedHour) || ((fireComponents.hour == selectedHour) && (fireComponents.minute >= selectedMinute)){
                dateFire=dateFire.addingTimeInterval(86400)  // Use tomorrow's date
                
                fireComponents=(calendar as NSCalendar).components([NSCalendar.Unit.day,NSCalendar.Unit.month,NSCalendar.Unit.year,NSCalendar.Unit.hour,NSCalendar.Unit.minute], from:dateFire)
            }
            
            
            fireComponents.hour = selectedHour!
            fireComponents.minute = selectedMinute!
            
            dateFire = calendar.date(from: fireComponents)!
            
            let now = Date()
            print(now)
            print(dateFire)
            
            let localNotification = UILocalNotification()
            localNotification.fireDate = dateFire
            localNotification.alertBody = "Hello, this is a notification from SCIM."
            localNotification.repeatInterval = NSCalendar.Unit.day
            
            UIApplication.shared.scheduleLocalNotification(localNotification)
            
            PatientItem4ViewController.notiStandardUserDefaults.set(true, forKey: "NotiSwitchState")
            


            
        } else {
            print("off")
            UIApplication.shared.cancelAllLocalNotifications()
            
            PatientItem4ViewController.notiStandardUserDefaults.set(false, forKey: "NotiSwitchState")
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(" ~~~~~ patient 4 ~~~~~")
        print("userIDInput in patient 4 is \(userIDInput)")
        print("firstName in patient 4 is \(firstName)")
        print("lastName in patient 4 is \(lastName)")
        print("type in patient 4 is \(type)")
        
        Day_Button.isHidden = true
        
        Name_Label.text = "\(firstName) \(lastName)";
        Logout_Label.text = "If you are not \(firstName) \(lastName), please logout."

        Logout_Button.layer.cornerRadius = 0.1 * Logout_Button.bounds.size.width
        
        self.Day_PickerView.isHidden = true
        self.Day_PickerView.dataSource = self
        Day_PickerView.delegate = self
        
        self.Time_DatePicker.isHidden = true

        
        let NowTime_Date = Date()
        let TimeFormatter = DateFormatter();
        TimeFormatter.dateFormat = "h:mm a"
        let NowTime_String = TimeFormatter.string(from: NowTime_Date);
        self.Time_Button.setTitle(NowTime_String, for: UIControlState())
        self.Time_String = NowTime_String
        
        self.Day_Button.setTitleColor(UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1), for: UIControlState())
        self.Time_Button.setTitleColor(UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1), for: UIControlState())
        
        
        //mySegmentedControl.setTitleTextAttributes([NSFontAttributeName: UIFont(name:"Trebuchet MS", size:14)!], forState: .Normal)
        //Day_PickerView.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
        
        if (PatientItem4ViewController.notiStandardUserDefaults.object(forKey: "NotiSwitchState") != nil) {
            Notification_Switch.isOn = PatientItem4ViewController.notiStandardUserDefaults.bool(forKey: "NotiSwitchState")
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Day_Array[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Day_Array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print ("I choosed every \(Day_Array[row]) day")
        self.Day_Button.setTitle(Day_Array[row], for: UIControlState())
        self.Day_String = Day_Array[row]

    }
    
    
//    func Notification (){
//        Time -= 1
//        print(Time)
//        if (Time == 0){
//            print("time <= 0 ~~")
//            var Submitting_Notification = UILocalNotification()
//            Submitting_Notification.alertAction = "title?"
//            Submitting_Notification.alertBody = "aaa"
//            Submitting_Notification.fireDate = NSDate(timeIntervalSinceNow: 0)
//            
//            UIApplication.sharedApplication().scheduleLocalNotification(Submitting_Notification)
//            Time = 7
//            //self.Time = 24*60*60*Int(self.Day_String)!
//        }
//        
//    }
}
