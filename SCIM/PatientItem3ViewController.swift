//
//  PatientItem3ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/11.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class PatientItem3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userIDInput = String()
    // var of SCIM
    var SCIMJSON = NSDictionary()
    var SCIMresponseID = Int()
    var SCIMdateAndTime = String()
    
    var SCIMAllHistory_Array = [[String: AnyObject]]()
    var QOLAllHistory_Array = [[String: AnyObject]]()
    

    var Q01S1 = Int()
    var Q02S2A = Int()
    var Q03S2B = Int()
    var Q04S3A = Int()
    var Q05S3B = Int()
    var Q06S4 = Int()
    var Q07S5 = Int()
    var Q08S6A = Int()
    var Q09S6B = Int()
    var Q10S6C = Int()
    var Q11S7A = Int()
    var Q12S7B = Int()
    var Q13S7C = Int()
    var Q14S8 = Int()
    var Q15S9 = Int()
    var Q16S10 = Int()
    var Q17S11 = Int()
    var Q18S12 = Int()
    var Q19S13 = Int()
    var Q20S14 = Int()
    var Q21S15 = Int()
    var Q22S16 = Int()
    var Q23S17 = Int()

    
    // var of QOL
    var QOLJSON = NSDictionary()
    var QOLresponseID = Int()
    var QOLdateAndTime = String()
    
    var Q1 = Int()
    var Q2 = Int()
    var Q3 = Int()
    
    var From_String = "All"
    var To_String = "All"
    var UserIDSearch_String = "All"


    
    @IBOutlet weak var SCIM_ScrollView: UIScrollView!
    @IBOutlet weak var QOL_ScrollView: UIScrollView!
    
    @IBOutlet weak var SCIMHistory_TableView: UITableView!
    var SCIMdateAndTime_Array : [String] = []
    
    @IBOutlet weak var QOLHistory_TableView: UITableView!
    var QOLdateAndTime_Array : [String] = []
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBAction func mySegmentedControlAction(_ sender: AnyObject) {
        
        let SCIMBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.SCIM_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let QOLBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.QOL_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)

        
        if sender.selectedSegmentIndex == 0{
            SCIMHistory_TableView.isHidden = false
            SCIM_ScrollView.isHidden = false
            SCIMRefreshControl.isHidden = false
            
            QOLHistory_TableView.isHidden = true
            QOL_ScrollView.isHidden = true
            QOLRefreshControl.isHidden = true
            
            
            self.view.removeConstraint(QOLBottomConstraint)
            self.view.addConstraint(SCIMBottomConstraint)
        }else {
            SCIMHistory_TableView.isHidden = true
            SCIM_ScrollView.isHidden = true
            SCIMRefreshControl.isHidden = true

            QOLHistory_TableView.isHidden = false
            QOL_ScrollView.isHidden = false
            QOLRefreshControl.isHidden = false
            
            self.view.removeConstraint(SCIMBottomConstraint)
            self.view.addConstraint(QOLBottomConstraint)
            
        }
    }
    
    @IBOutlet weak var DatePicker_View: UIView!
    @IBOutlet weak var From_DatePicker: UIDatePicker!
    @IBOutlet weak var To_DatePicker: UIDatePicker!

    
    @IBOutlet weak var From_Button: UIButton!
    @IBOutlet weak var To_Button: UIButton!

    @IBAction func From_ButtonAction(_ sender: AnyObject) {
        if self.From_DatePicker.isHidden == true{
            self.DatePicker_View.superview?.bringSubview(toFront: DatePicker_View)
            self.DatePicker_View.isHidden  = false
            self.From_DatePicker.isHidden = false
            self.To_DatePicker.isHidden = true
            
            From_Button.layer.borderWidth = 2.0
            To_Button.layer.borderWidth = 1.0
        } else {
            self.DatePicker_View.isHidden  = true
            self.From_DatePicker.isHidden = true
            self.To_DatePicker.isHidden = true
            
            From_Button.layer.borderWidth = 1.0
            To_Button.layer.borderWidth = 1.0
        }

    }

    
    @IBAction func To_ButtonAction(_ sender: AnyObject) {
        if self.To_DatePicker.isHidden == true{
            self.DatePicker_View.superview?.bringSubview(toFront: DatePicker_View)
            self.DatePicker_View.isHidden = false
            self.To_DatePicker.isHidden = false
            self.From_DatePicker.isHidden = true
            To_Button.layer.borderWidth = 2.0
            From_Button.layer.borderWidth = 1.0
        } else {
            self.DatePicker_View.isHidden = true
            self.To_DatePicker.isHidden = true
            self.From_DatePicker.isHidden = true
            To_Button.layer.borderWidth = 1.0
            From_Button.layer.borderWidth = 1.0
        }
    }
    
    
    @IBAction func From_DatePicker(_ sender: AnyObject) {
        DispatchQueue.main.async(execute: {
            let DayFormatter = DateFormatter();
            DayFormatter.dateFormat = "yyyy-MM-dd"
            let SelectedDay_String = DayFormatter.string(from: self.From_DatePicker.date)
            self.From_Button.setTitle(SelectedDay_String, for: UIControlState())
            self.From_String = SelectedDay_String
            print ("From the day \(self.From_String)")
        })
        

    }
    
    @IBAction func To_DatePicker(_ sender: AnyObject) {
        DispatchQueue.main.async(execute: {
            let DayFormatter = DateFormatter();
            DayFormatter.dateFormat = "yyyy-MM-dd"
            let SelectedDay_String = DayFormatter.string(from: self.To_DatePicker.date)
            self.To_Button.setTitle(SelectedDay_String, for: UIControlState())
            self.To_String = SelectedDay_String
        })
 
    }

    
    @IBOutlet weak var Search_Button: UIButton!
    @IBAction func Search_ButtonAction(_ sender: AnyObject) {
        SCIMTry = 1
        QOLTry = 1
        
        self.DatePicker_View.isHidden = true
        self.To_DatePicker.isHidden = true
        self.From_DatePicker.isHidden = true
        To_Button.layer.borderWidth = 1.0
        From_Button.layer.borderWidth = 1.0
        
        getSCIMHistory("http://Localhost:8080/SCIM/GetSCIMHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String )
        
        getQOLHistory("http://Localhost:8080/SCIM/GetQOLHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String)

    }
    
    var Time1 = 5;
    var Time2 = 5;
    var Timer1 = Timer()
    var Timer2 = Timer()
    
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    var SCIMRefreshControl = UIRefreshControl()
    var QOLRefreshControl = UIRefreshControl()
    
    @IBOutlet weak var SCIMHistoryTableViewHeight_Constraint: NSLayoutConstraint!
    @IBOutlet weak var QOLHistoryTableViewHeight_Constraint: NSLayoutConstraint!
    
    var SCIMTry = 1;
    var QOLTry = 1;
    
    @IBOutlet weak var SCIMGetMore_Button: UIButton!
    @IBAction func SCIMGetMore_Button(_ sender: AnyObject) {
        self.SCIMTry = self.SCIMTry+1
        print("SCIM get more TRY \(self.SCIMTry)")
        getSCIMHistory("http://10.1.1.238:8080/SCIM/GetSCIMHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String )
    }
    
    @IBOutlet weak var QOLGetMore_Button: UIButton!
    @IBAction func QOLGetMore_Button(_ sender: AnyObject) {
        self.QOLTry = self.QOLTry+1
        print("QOL get more TRY \(self.QOLTry)")
        getQOLHistory("http://10.1.1.238:8080/SCIM/GetQOLHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String )
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SCIMHistory_TableView.isHidden = false
        QOLHistory_TableView.isHidden = true
        
        initilizeButonFromAndTo(From_Button)
        initilizeButonFromAndTo(To_Button)

        Search_Button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        Search_Button.layer.cornerRadius = 0.1 * Search_Button.bounds.size.width
        
        DatePicker_View.isHidden  = true
        From_DatePicker.isHidden = true
        To_DatePicker.isHidden = true
      //  FromTo_DatePicker.setValue(UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1), forKeyPath: "textColor")
        From_DatePicker.layer.borderColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        From_DatePicker.layer.borderWidth = 2.0
        From_DatePicker.layer.cornerRadius = 0.1 * From_DatePicker.bounds.size.width
        
        
        To_DatePicker.layer.borderColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        To_DatePicker.layer.borderWidth = 2.0
        To_DatePicker.layer.cornerRadius = 0.1 * To_DatePicker.bounds.size.width


        
        UserIDSearch_String = userIDInput
        getSCIMHistory("http://localhost:8080/SCIM/GetSCIMHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String )
        
        getQOLHistory("http://localhost:8080/SCIM/GetQOLHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String)
        
        print("Patient 3 userIDInput : \(userIDInput)")

        self.SCIMHistory_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        self.SCIMHistory_TableView.dataSource = self
        SCIMHistory_TableView.delegate = self
        
        self.QOLHistory_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        self.QOLHistory_TableView.dataSource = self
        QOLHistory_TableView.delegate = self
        
        mySegmentedControl.setTitleTextAttributes([NSFontAttributeName: UIFont(name:"Trebuchet MS", size:14)!], for: UIControlState())
        
        
        SCIMRefreshControl.addTarget(self, action: #selector(PatientItem3ViewController.SCIMPullToFresh), for: UIControlEvents.valueChanged)
        QOLRefreshControl.addTarget(self, action: #selector(PatientItem3ViewController.QOLPullToFresh), for: UIControlEvents.valueChanged)
        setRefreshControlStyle(SCIMRefreshControl)
        setRefreshControlStyle(QOLRefreshControl)
        SCIM_ScrollView.addSubview(SCIMRefreshControl)
        QOL_ScrollView.addSubview(QOLRefreshControl)
        
        
        SCIM_ScrollView.contentSize.height = 1000
        QOL_ScrollView.contentSize.height = 1000
        
        self.QOLHistoryTableViewHeight_Constraint.constant = CGFloat(self.QOLdateAndTime_Array.count-9) * 44
        

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SCIMPullToFresh(){
        print("here is onPullToFresh SCIM")
        SCIMTry = 1
        getSCIMHistory("http://localhost:8080/SCIM/GetSCIMHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String )
    }
    
    func QOLPullToFresh(){
        QOLTry = 1
        print("here is onPullToFresh QOL")
        getQOLHistory("http://localhost:8080/SCIM/GetQOLHistory", userIDInput_p: UserIDSearch_String, fromDate_p: From_String, toDate_p: To_String)
    }
    

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        self.myScrollView.frame = self.view.bounds
//        self.myScrollView.contentSize.height = 1000
//        self.myScrollView.contentSize.width = 0
//        
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, canEditingStyle editingStyle:UITableViewCellEditingStyle) -> Bool{
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == SCIMHistory_TableView{
            return self.SCIMdateAndTime_Array.count
        }else {
            return self.QOLdateAndTime_Array.count
        }

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == SCIMHistory_TableView{
            let cell:UITableViewCell = self.SCIMHistory_TableView.dequeueReusableCell(withIdentifier: "cell1")! as     UITableViewCell
            cell.textLabel!.text = String(self.SCIMdateAndTime_Array[indexPath.row])
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            setCellStyle(cell)
            setTabelView(tableView)
            return cell

        }else{
            let cell:UITableViewCell = self.QOLHistory_TableView.dequeueReusableCell(withIdentifier: "cell2")! as     UITableViewCell
            cell.textLabel!.text = String(self.QOLdateAndTime_Array[indexPath.row])
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            setCellStyle(cell)
            setTabelView(tableView)
            return cell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView!, didSelectRowAt indexPath: IndexPath) {
        if tableView == SCIMHistory_TableView {
            //if let SCIMHistory = self.SCIMJSON!["SCIMHistory"] as? [[String: AnyObject]] {
                if let responseID_temp = self.SCIMAllHistory_Array[indexPath.row]["responseID"] as? String {
                    self.SCIMresponseID = Int(responseID_temp)!
                }
                if let dateAndTime_temp = self.SCIMAllHistory_Array[indexPath.row]["dateAndTime"] as? String {
                    self.SCIMdateAndTime = dateAndTime_temp
                }
                if let Q01S1_temp = self.SCIMAllHistory_Array[indexPath.row]["Q01S1"] as? String {
                    self.Q01S1 = Int(Q01S1_temp)!
                }
                if let Q02S2A_temp = self.SCIMAllHistory_Array[indexPath.row]["Q02S2A"] as? String {
                    self.Q02S2A = Int(Q02S2A_temp)!
                }
                if let Q03S2B_temp = self.SCIMAllHistory_Array[indexPath.row]["Q03S2B"] as? String {
                    self.Q03S2B = Int(Q03S2B_temp)!
                }
                if let Q04S3A_temp = self.SCIMAllHistory_Array[indexPath.row]["Q04S3A"] as? String {
                    self.Q04S3A = Int(Q04S3A_temp)!
                }
                if let Q05S3B_temp = self.SCIMAllHistory_Array[indexPath.row]["Q05S3B"] as? String {
                    self.Q05S3B = Int(Q05S3B_temp)!
                }
                if let Q06S4_temp = self.SCIMAllHistory_Array[indexPath.row]["Q06S4"] as? String {
                    self.Q06S4 = Int(Q06S4_temp)!
                }
                if let Q07S5_temp = self.SCIMAllHistory_Array[indexPath.row]["Q07S5"] as? String {
                    self.Q07S5 = Int(Q07S5_temp)!
                }
                if let Q08S6A_temp = self.SCIMAllHistory_Array[indexPath.row]["Q08S6A"] as? String {
                    self.Q08S6A = Int(Q08S6A_temp)!
                }
                if let Q09S6B_temp = self.SCIMAllHistory_Array[indexPath.row]["Q09S6B"] as? String {
                    self.Q09S6B = Int(Q09S6B_temp)!
                }
                if let Q10S6C_temp = self.SCIMAllHistory_Array[indexPath.row]["Q10S6C"] as? String {
                    self.Q10S6C = Int(Q10S6C_temp)!
                }
                if let Q11S7A_temp = self.SCIMAllHistory_Array[indexPath.row]["Q11S7A"] as? String {
                    self.Q11S7A = Int(Q11S7A_temp)!
                }
                if let Q12S7B_temp = self.SCIMAllHistory_Array[indexPath.row]["Q12S7B"] as? String {
                    self.Q12S7B = Int(Q12S7B_temp)!
                }
                if let Q13S7C_temp = self.SCIMAllHistory_Array[indexPath.row]["Q13S7C"] as? String {
                    self.Q13S7C = Int(Q13S7C_temp)!
                }
                if let Q14S8_temp = self.SCIMAllHistory_Array[indexPath.row]["Q14S8"] as? String {
                    self.Q14S8 = Int(Q14S8_temp)!
                }
                if let Q15S9_temp = self.SCIMAllHistory_Array[indexPath.row]["Q15S9"] as? String {
                    self.Q15S9 = Int(Q15S9_temp)!
                }
                if let Q16S10_temp = self.SCIMAllHistory_Array[indexPath.row]["Q16S10"] as? String {
                    self.Q16S10 = Int(Q16S10_temp)!
                }
                if let Q17S11_temp = self.SCIMAllHistory_Array[indexPath.row]["Q17S11"] as? String {
                    self.Q17S11 = Int(Q17S11_temp)!
                }
                if let Q18S12_temp = self.SCIMAllHistory_Array[indexPath.row]["Q18S12"] as? String {
                    self.Q18S12 = Int(Q18S12_temp)!
                }
                if let Q19S13_temp = self.SCIMAllHistory_Array[indexPath.row]["Q19S13"] as? String {
                    self.Q19S13 = Int(Q19S13_temp)!
                }
                if let Q20S14_temp = self.SCIMAllHistory_Array[indexPath.row]["Q20S14"] as? String {
                    self.Q20S14 = Int(Q20S14_temp)!
                }
                if let Q21S15_temp = self.SCIMAllHistory_Array[indexPath.row]["Q21S15"] as? String {
                    self.Q21S15 = Int(Q21S15_temp)!
                }
                if let Q22S16_temp = self.SCIMAllHistory_Array[indexPath.row]["Q22S16"] as? String {
                    self.Q22S16 = Int(Q22S16_temp)!
                }
                if let Q23S17_temp = self.SCIMAllHistory_Array[indexPath.row]["Q23S17"] as? String {
                    self.Q23S17 = Int(Q23S17_temp)!
                }
                
            //}
            performSegue(withIdentifier: "ShowOneHistorySCIM_Segue", sender: self)
            
        } else{
            //if let QOLHistory = self.QOLJSON!["QOLHistory"] as? [[String: AnyObject]] {
                if let responseID_temp = self.QOLAllHistory_Array[indexPath.row]["responseID"] as? String {
                    self.QOLresponseID = Int(responseID_temp)!
                }
                if let dateAndTime_temp = self.QOLAllHistory_Array[indexPath.row]["dateAndTime"] as? String {
                    self.QOLdateAndTime = dateAndTime_temp
                }
                if let Q1_temp = self.QOLAllHistory_Array[indexPath.row]["Q1"] as? String {
                    self.Q1 = Int(Q1_temp)!
                }
                if let Q2_temp = self.QOLAllHistory_Array[indexPath.row]["Q2"] as? String {
                    self.Q2 = Int(Q2_temp)!
                }
                if let Q3_temp = self.QOLAllHistory_Array[indexPath.row]["Q3"] as? String {
                    self.Q3 = Int(Q3_temp)!
                }
            //}
            performSegue(withIdentifier: "ShowOneHistoryQOL_Segue", sender: self)
            
        }
        //var fetched_data:JSON = []
    }
    
    
    func setCellStyle (_ cell:UITableViewCell) {
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping;
        cell.textLabel!.numberOfLines = 5;
        cell.textLabel!.font = UIFont(name:"Trebuchet MS", size:14)
        //cell.textLabel!.textColor = UIColor.darkGrayColor()
    }
    
    func setTabelView (_ tableView: UITableView){
        tableView.estimatedRowHeight = 20.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    func getSCIMHistory (_ urlString: String, userIDInput_p: String, fromDate_p: String, toDate_p: String){
        
        if self.SCIMRefreshControl.isRefreshing == false {
            self.myActivityIndicatorView.superview?.bringSubview(toFront: myActivityIndicatorView)
            self.myActivityIndicatorView.isHidden = false
            self.myActivityIndicatorView.startAnimating()
        }

        self.Time1 = 5
        self.Timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PatientItem3ViewController.TimeOut1), userInfo: nil, repeats: true)
        
        let url = URL(string: urlString)
        

        if self.SCIMTry == 1 {
            SCIMdateAndTime_Array = [];
        }
        
        var startRowNum = (self.SCIMTry-1)*20
        
        let request = NSMutableURLRequest(url:url!);
        request.httpMethod = "POST";
        let postString = "userIDInput=\(userIDInput_p)&&fromDate=\(fromDate_p)&&toDate=\(toDate_p)&&startRowNum=\(startRowNum)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            // let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            if error != nil
            {
                print("error=\(error)")
                
                OperationQueue.main.addOperation {
                    self.Timer1.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    self.SCIMRefreshControl.endRefreshing()
                    self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
                }
                
                return
            }

            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(responseString)")
            
            do {
                self.SCIMJSON = try JSONSerialization.jsonObject(with: data!, options:.mutableLeaves) as! NSDictionary
                //print (self.SCIMJSON)
                var lengthOfJSON = 0;
                if let SCIMHistory = self.SCIMJSON["SCIMHistory"] as? [[String: AnyObject]] {
                    self.SCIMAllHistory_Array = self.SCIMAllHistory_Array+SCIMHistory
                    for SCIMHistory in SCIMHistory {
                        if let oneDateAndTime = SCIMHistory["dateAndTime"] as? String {
                            self.SCIMdateAndTime_Array.append(oneDateAndTime)
                        }
                        lengthOfJSON = lengthOfJSON+1
                    }
                }
                //print(self.SCIMdateAndTime_Array)

                DispatchQueue.main.async(execute: {
                    self.Timer1.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    
                    self.SCIMRefreshControl.endRefreshing()
                    
                    self.SCIMHistoryTableViewHeight_Constraint.constant = CGFloat(self.SCIMdateAndTime_Array.count-10) * 44
                    
                    if self.SCIMdateAndTime_Array.count < 10{
                        self.SCIM_ScrollView.contentSize.height = CGFloat(10 * 44 + 60)
                    }else{
                        self.SCIM_ScrollView.contentSize.height = CGFloat((self.SCIMdateAndTime_Array.count) * 44 + 60)
                    }
                    
                    if  self.mySegmentedControl.selectedSegmentIndex == 0{
                        var SCIMBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.SCIM_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
                        self.view.addConstraint(SCIMBottomConstraint)
                    }else {
                        self.SCIM_ScrollView.isHidden = true
                        self.SCIMHistory_TableView.isHidden = true
                        self.SCIMRefreshControl.isHidden = true
                    }
                    
                    self.SCIMGetMore_Button.superview?.bringSubview(toFront: self.SCIMGetMore_Button)
                    
                    if lengthOfJSON<20{
                        self.SCIMGetMore_Button.setTitle("No More", for: UIControlState())
                        self.SCIMGetMore_Button.setTitleColor(UIColor.gray, for: UIControlState())
                        self.SCIMGetMore_Button.isEnabled = false
                    }else{
                        self.SCIMGetMore_Button.setTitle("Get More", for: UIControlState())
                        self.SCIMGetMore_Button.setTitleColor(UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1), for: UIControlState())
                        self.SCIMGetMore_Button.isEnabled = true
                    }

                    
                    self.SCIMHistory_TableView.reloadData()
                    print("have reload SCIM")
                })
 
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })

        task.resume()
    }
    
    func getQOLHistory (_ urlString: String, userIDInput_p: String, fromDate_p: String, toDate_p: String){
        
        if self.QOLRefreshControl.isRefreshing == false {
            self.myActivityIndicatorView.superview?.bringSubview(toFront: myActivityIndicatorView)
            self.myActivityIndicatorView.isHidden = false
            self.myActivityIndicatorView.startAnimating()
        }
        
        self.Time2 = 5
        self.Timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PatientItem3ViewController.TimeOut2), userInfo: nil, repeats: true)
        
        print ("** Start func getTypeAndSkip **")
        let url = URL(string: urlString)
        
        if self.QOLTry == 1 {
            QOLdateAndTime_Array = [];
        }
        var startRowNum = (self.QOLTry-1)*20
        
        let request = NSMutableURLRequest(url:url!);
        request.httpMethod = "POST";
        let postString = "userIDInput=\(userIDInput_p)&&fromDate=\(fromDate_p)&&toDate=\(toDate_p)&&startRowNum=\(startRowNum)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            // let task = NSURLSession.sharedSession().dataTaskWithURL(url!){(data, response, error) in
            if error != nil
            {
                print("error=\(error)")
          
                OperationQueue.main.addOperation {
                    self.Timer2.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    self.QOLRefreshControl.endRefreshing()
                    self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
                    
                }
                
                return
            }
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(responseString)")
            
            do {
                self.QOLJSON = try JSONSerialization.jsonObject(with: data! as Data, options:JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary

                //self.QOLJSON = try JSONSerialization.jsonObject(with: data! as Data, options:.mutableLeaves) as? NSDictionary
                //print (self.QOLJSON)
                var lengthOfJSON = 0;
                if let QOLHistory = self.QOLJSON["QOLHistory"] as? [[String: AnyObject]] {
                    self.QOLAllHistory_Array = self.QOLAllHistory_Array+QOLHistory
                    for QOLHistory in QOLHistory {
                        if let oneDateAndTime = QOLHistory["dateAndTime"] as? String {
                            self.QOLdateAndTime_Array.append(oneDateAndTime)
                        }
                        lengthOfJSON = lengthOfJSON+1
                    }
                }
                DispatchQueue.main.async(execute: {
                    self.Timer2.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    self.QOLRefreshControl.endRefreshing()
                    self.QOLHistoryTableViewHeight_Constraint.constant = CGFloat(self.QOLdateAndTime_Array.count-10) * 44
                    print(self.QOLdateAndTime_Array.count)
                    print(self.QOLdateAndTime_Array.count-10)
                    if self.QOLdateAndTime_Array.count < 10{
                        self.QOL_ScrollView.contentSize.height = CGFloat(10 * 44 + 60)
                    }else{
                        self.QOL_ScrollView.contentSize.height = CGFloat((self.QOLdateAndTime_Array.count) * 44 + 60)
                    }
                    
                    
                    if  self.mySegmentedControl.selectedSegmentIndex == 1{
                        var QOLBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.QOL_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
                        self.view.addConstraint(QOLBottomConstraint)
                    }else {
                        self.QOL_ScrollView.isHidden = true
                        self.QOLHistory_TableView.isHidden = true
                        self.QOLRefreshControl.isHidden = true
                    }
                    
                    self.QOLGetMore_Button.superview?.bringSubview(toFront: self.QOLGetMore_Button)
                    
                    if self.QOLdateAndTime_Array.count < self.QOLTry*20 {
                        self.QOLGetMore_Button.setTitle("No More", for: UIControlState())
                    }else{
                        self.QOLGetMore_Button.setTitle("Get More", for: UIControlState())
                    }
                    
                    if lengthOfJSON<20{
                        self.QOLGetMore_Button.setTitle("No More", for: UIControlState())
                        self.QOLGetMore_Button.setTitleColor(UIColor.gray, for: UIControlState())
                        self.QOLGetMore_Button.isEnabled = false
                    }else{
                        self.QOLGetMore_Button.setTitle("Get More", for: UIControlState())
                        self.QOLGetMore_Button.setTitleColor(UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1), for: UIControlState())
                        self.QOLGetMore_Button.isEnabled = true
                    }
                    
                    
                    self.QOLHistory_TableView.reloadData()
                    print("have reload QOL")
                })
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "ShowOneHistorySCIM_Segue") {
            let DestViewController : OneHistorySCIMViewController = segue.destination as!OneHistorySCIMViewController
            DestViewController.userIDInput = userIDInput;
            DestViewController.SCIMresponseID = SCIMresponseID
            DestViewController.SCIMdateAndTime = SCIMdateAndTime
            DestViewController.Q01S1 = Q01S1
            DestViewController.Q02S2A = Q02S2A
            DestViewController.Q03S2B = Q03S2B
            DestViewController.Q04S3A = Q04S3A
            DestViewController.Q05S3B = Q05S3B
            DestViewController.Q06S4 = Q06S4
            DestViewController.Q07S5 = Q07S5
            DestViewController.Q08S6A = Q08S6A
            DestViewController.Q09S6B = Q09S6B
            DestViewController.Q10S6C = Q10S6C
            DestViewController.Q11S7A = Q11S7A
            DestViewController.Q12S7B = Q12S7B
            DestViewController.Q13S7C = Q13S7C
            DestViewController.Q14S8 = Q14S8
            DestViewController.Q15S9 = Q15S9
            DestViewController.Q16S10 = Q16S10
            DestViewController.Q17S11 = Q17S11
            DestViewController.Q18S12 = Q18S12
            DestViewController.Q19S13 = Q19S13
            DestViewController.Q20S14 = Q20S14
            DestViewController.Q21S15 = Q21S15
            DestViewController.Q22S16 = Q22S16
            DestViewController.Q23S17 = Q23S17
        }else{
            let DestViewController : OneHistoryQOLViewController = segue.destination as!OneHistoryQOLViewController
            DestViewController.userIDInput = userIDInput;
            DestViewController.QOLresponseID = QOLresponseID
            DestViewController.QOLdateAndTime = QOLdateAndTime
            DestViewController.Q1 = Q1
            DestViewController.Q2 = Q2
            DestViewController.Q3 = Q3
        }

    }

    func initilizeButonFromAndTo (_ Button : UIButton){
        Button.layer.borderColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        Button.layer.borderWidth = 1.0
        Button.layer.cornerRadius = 0.1 * Button.bounds.size.width
        Button.clipsToBounds = true
        Button.backgroundColor = UIColor.white
        
    }

    func showCancelAlert (_ title_p:String, message_p:String, actionTitle_p: String) {
        let ok_Alert = UIAlertController (title: title_p, message: message_p, preferredStyle: UIAlertControllerStyle.alert)
        let OkeyButton_AlertAction = UIAlertAction (title: actionTitle_p, style:UIAlertActionStyle.cancel, handler: nil)
        ok_Alert.addAction(OkeyButton_AlertAction)
        present(ok_Alert, animated:true, completion: nil)
        
    }
    func TimeOut1 (){
        Time1 -= 1
        print("Time1: \(Time1)")
        if (Time1 == 0){
            print("time <= 0 ~~")
            self.myActivityIndicatorView.isHidden = true
            self.SCIMRefreshControl.endRefreshing()
            self.QOLRefreshControl.endRefreshing()
            self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
            self.Timer1.invalidate()
            
        }
        
    }
    
    func TimeOut2 (){
        Time2 -= 1
        print("Time2: \(Time2)")
        if (Time2 == 0){
            print("time <= 0 ~~")
            self.myActivityIndicatorView.isHidden = true
            self.SCIMRefreshControl.endRefreshing()
            self.QOLRefreshControl.endRefreshing()
            self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
            self.Timer2.invalidate()
            
        }
        
    }
    func setRefreshControlStyle(_ refreshControl :  UIRefreshControl){
        let myAttribute = [ NSFontAttributeName: UIFont(name: "Trebuchet MS", size: 14.0)!,NSForegroundColorAttributeName: UIColor.white  ]
        refreshControl.attributedTitle = NSAttributedString(string: "Loading", attributes: myAttribute)
        refreshControl.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        refreshControl.tintColor = UIColor.white
    }



}
