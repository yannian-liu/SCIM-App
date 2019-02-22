//
//  PatientItem1ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/6.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class PatientItem1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let A01S1_01_String = "[0] I need artificial feeding or a stomach tube."
    let A01S1_02_String = "[0] I need total assistance with eating/drinking."
    let A01S1_03_String = "[1] I need partial assistance with eating/drinking or for putting on/taking off adaptive devices."
    let A01S1_04_String = "[2] I eat/drink independently, but I need adaptive devices or assistance for cutting food, pouring drinks or opening containers."
    let A01S1_05_String = "[3] I eat/drink independently without assistance or adaptive devices."
    
    let A02S2A_01_String = "[0] I need total assistance."
    let A02S2A_02_String = "[1] I need partial assistance."
    let A02S2A_03_String = "[2] I am independent but need adaptive devices or specific equipment (e.g., bars, chair)."
    let A02S2A_04_String = "[3] I am independent and do not need adaptive devices or specific equipment."
    
    let A03S2B_01_String = "[0] I need total assistance.";
    let A03S2B_02_String = "[1] I need partial assistance.";
    let A03S2B_03_String = "[2] I am independent but need adaptive devices or specific equipment (e.g., bars, chair).";
    let A03S2B_04_String = "[3] I am independent and do not need adaptive devices or specific equipment.";
    
    
    let A04S3A_01_String = "[0] I need total assistance."
    let A04S3A_02_String = "[1] I need partial assistance, even with easy-to-dress clothes."
    let A04S3A_03_String = "[2] I do not need assistance with easy-to-dress clothes, but I need adaptive devices or specific equipment."
    let A04S3A_04_String = "[3] I am independent with easy-to-dress clothes and only need assistance or adaptive devices or a specific setting with difficult-to-dress clothes."
    let A04S3A_05_String = "[4] I am completely independent."
    
    let A05S3B_01_String = "[0] I need total assistance."
    let A05S3B_02_String = "[1] I need partial assistance, even with easy-to-dress clothes."
    let A05S3B_03_String = "[2] I do not need assistance with easy-to-dress clothes, but I need adaptive devices or specific equipment."
    let A05S3B_04_String = "[3] I am independent with easy-to-dress clothes and only need assistance or adaptive devices or a specific setting with difficult-to- dress clothes."
    let A05S3B_05_String = "[4] I am completely independent."
    
    let A06S4_01_String = "[0] I need total assistance."
    let A06S4_02_String = "[1] I need partial assistance."
    let A06S4_03_String = "[2] I am independent with adaptive devices."
    let A06S4_04_String = "[3] I am independent without adaptive devices."
    
    let A07S5_01_String = "[0] as well as permanent or from time to time assisted ventilation."
    let A07S5_02_String = "[2] as well as extra oxygen and a lot of assistance in coughing or respiratory tube management."
    let A07S5_03_String = "[4] as well as little assistance in coughing or respiratory tube management."
    let A07S5_04_String = "[6] but I need extra oxygen or a lot of assistance in coughing or a mask (e.g., PEEP) or assisted ventilation from time to time (e.g., BIPAP)."
    let A07S5_05_String = "[8] and only little assistance or stimulation for coughing."
    let A07S5_06_String = "[10] and can breathe and cough independently without any assistance or adaptive devices."
    
    
    let A08S6A_01_String = "[0] Yes - Please go to question 7A."
    let A08S6A_02_String = "[1] No - Please also answer questions 6B and 6C."
    
    let A09S6B_01_String = "[0] I need total assistance."
    let A09S6B_02_String = "[1] I do it myself with assistance (self-catheterization)."
    let A09S6B_03_String = "[2] I do it myself without assistance (self-catheterization)."
    let A09S6B_04_String = "[3] I do not use it."
    
    
    let A10S6C_01_String = "[0] I need total assistance for using them."
    let A10S6C_02_String = "[1] I need partial assistance for using them."
    let A10S6C_03_String = "[2] I use them without assistance."
    let A10S6C_04_String = "[3] I am continent with urine and do not use external drainage instruments."
    
    let A11S7A_01_String = "[0] Yes"
    let A11S7A_02_String = "[1] No"
    
    let A12S7B_01_String = "[0] irregular or seldom (less than once in 3 days)."
    let A12S7B_02_String = "[1] regular (once in 3 days or more)."
    
    let A13S7C_01_String = "[0] twice a month or more."
    let A13S7C_02_String = "[1] once a month."
    let A13S7C_03_String = "[2] not at all."
    
    let A14S8_01_String = "[0] I need total assistance."
    let A14S8_02_String = "[1] I need partial assistance and cannot clean myself."
    let A14S8_03_String = "[2] I need partial assistance but can clean myself."
    let A14S8_04_String = "[4] I do not need assistance but I need adaptive devices (e.g., bars) or a special setting (e.g., wheelchair accessible toilet)."
    let A14S8_05_String = "[5] I do not need any assistance, adaptive devices or a special setting."
    
    let A15S9_01_String = "[0] None, I need assistance in all these activities."
    let A15S9_02_String = "[2] One"
    let A15S9_03_String = "[4] Two or three"
    let A15S9_04_String = "[6] All of them"
    
    let A16S10_01_String = "[0] I need total assistance."
    let A16S10_02_String = "[1] I need partial assistance, supervision or adaptive devices (e.g., sliding board)."
    let A16S10_03_String = "[2] I do not need any assistance or adaptive devices."
    let A16S10_04_String = "[2] I do not use a wheelchair."


    let A17S11_01_String = "[0] I need total assistance."
    let A17S11_02_String = "[1] I need partial assistance, supervision or adaptive devices (e.g., grab-bars)."
    let A17S11_03_String = "[2] I do not need any assistance or adaptive devices."
    let A17S11_04_String = "[2] I do not use a wheelchair."
    
    let A18S12_01_String = "[0] I need total assistance."
    let A18S12_02_String = "[1] I need an electric wheelchair or partial assistance to operate a manual wheelchair."
    let A18S12_03_String = "[2] I am independent in a manual wheelchair."
    let A18S12_04_String = "[3] need supervision while walking (with or without walking aids)."
    let A18S12_05_String = "[4] walk with a walking frame or crutches, swinging forward with both feet at a time."
    let A18S12_06_String = "[5] walk with crutches or two canes, setting one foot before the other."
    let A18S12_07_String = "[6] walk with one cane."
    let A18S12_08_String = "[7] walk with a leg orthosis(es) only (e.g., leg splint)."
    let A18S12_09_String = "[8] walk without walking aids."
    
    let A19S13_01_String = "[0] I need total assistance."
    let A19S13_02_String = "[1] I need an electric wheelchair or partial assistance to operate a manual wheelchair."
    let A19S13_03_String = "[2] I am independent in a manual wheelchair."
    let A19S13_04_String = "[3] need supervision while walking (with or without walking aids)."
    let A19S13_05_String = "[4] walk with a walking frame or crutches, swinging forward with both feet at a time."
    let A19S13_06_String = "[5] walk with crutches or two canes, setting one foot before the other."
    let A19S13_07_String = "[6] walk with one cane."
    let A19S13_08_String = "[7] walk with a leg orthosis(es) only (e.g., leg splint)."
    let A19S13_09_String = "[8] walk without walking aids."
    
    
    let A20S14_01_String = "[0] I need total assistance."
    let A20S14_02_String = "[1] I need an electric wheelchair or partial assistance to operate a manual wheelchair."
    let A20S14_03_String = "[2] I am independent in a manual wheelchair."
    let A20S14_04_String = "[3] need supervision while walking (with or without walking aids)."
    let A20S14_05_String = "[4] walk with a walking frame or crutches, swinging forward with both feet at a time."
    let A20S14_06_String = "[5] walk with crutches or two canes, setting one foot before the other."
    let A20S14_07_String = "[6] walk with one cane."
    let A20S14_08_String = "[7] walk with a leg orthosis(es) only (e.g., leg splint)."
    let A20S14_09_String = "[8] walk without walking aids."
    
    let A21S15_01_String = "[0] I am unable to go up and down stairs."
    let A21S15_02_String = "[1] but only with assistance or supervision."
    let A21S15_03_String = "[2] but only with devices (e.g., handrail, crutch or cane)."
    let A21S15_04_String = "[3] without any assistance, supervision or devices."
    
    let A22S16_01_String = "[0] I need total assistance."
    let A22S16_02_String = "[1] I need partial assistance, supervision or adaptive devices."
    let A22S16_03_String = "[2] I do not need any assistance or adaptive devices."
    let A22S16_04_String = "[2] I do not use a wheelchair."
    
    let A23S17_01_String = "[0] I need assistance."
    let A23S17_02_String = "[1] I do not need any assistance."
    let A23S17_03_String = "[1] I do not use a wheelchair."


    
    var userIDInput = String();
    
    //  *** default is "9". result[0] means nothing ,it is always 0.  result[1] is the answer of question 1, result[2] is the answer of quesntion 2
    var result: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var QestionCorrespondence: [String] = ["0","1","2A","2B","3A","3B","4","5","6A","6B","6C","7A","7B","7C","8","9","10","11","12","13","14","15","16","17"]

    @IBOutlet weak var myScrollView: UIScrollView!

   
    @IBOutlet weak var Q01S1_TableView: UITableView!
    @IBOutlet weak var Q02S2A_TableView: UITableView!
    @IBOutlet weak var Q03S2B_TableView: UITableView!
    @IBOutlet weak var Q04S3A_TableView: UITableView!
    @IBOutlet weak var Q05S3B_TableView: UITableView!
    @IBOutlet weak var Q06S4_TableView: UITableView!
    @IBOutlet weak var Q07S5_TableView: UITableView!
    @IBOutlet weak var Q08S6A_TableView: UITableView!
    @IBOutlet weak var Q09S6B_TableView: UITableView!
    @IBOutlet weak var Q10S6C_TableView: UITableView!
    @IBOutlet weak var Q11S7A_TableView: UITableView!
    @IBOutlet weak var Q12S7B_TableView: UITableView!
    @IBOutlet weak var Q13S7C_TableView: UITableView!
    @IBOutlet weak var Q14S8_TableView: UITableView!
    @IBOutlet weak var Q15S9_TableView: UITableView!
    @IBOutlet weak var Q16S10_TableView: UITableView!
    @IBOutlet weak var Q17S11_TableView: UITableView!
    @IBOutlet weak var Q18S12_TableView: UITableView!
    @IBOutlet weak var Q19S13_TableView: UITableView!
    @IBOutlet weak var Q20S14_TableView: UITableView!
    @IBOutlet weak var Q21S15_TableView: UITableView!
    @IBOutlet weak var Q22S16_TableView: UITableView!
    @IBOutlet weak var Q23S17_TableView: UITableView!
    
    
    
    
    
    var Q1_Array = [String]()
    var Q2_Array = [String]()
    var Q3_Array = [String]()
    var Q4_Array = [String]()
    var Q5_Array = [String]()
    var Q6_Array = [String]()
    var Q7_Array = [String]()
    var Q8_Array = [String]()
    var Q9_Array = [String]()
    var Q10_Array = [String]()
    var Q11_Array = [String]()
    var Q12_Array = [String]()
    var Q13_Array = [String]()
    var Q14_Array = [String]()
    var Q15_Array = [String]()
    var Q16_Array = [String]()
    var Q17_Array = [String]()
    var Q18_Array = [String]()
    var Q19_Array = [String]()
    var Q20_Array = [String]()
    var Q21_Array = [String]()
    var Q22_Array = [String]()
    var Q23_Array = [String]()
    
    var Empty_Array = [String]()
    
    
    @IBOutlet weak var SubmitSCIMSelfReport_Button: UIButton!
    
    @IBAction func SubmitSCIMSelfReport_ButtonAction(_ sender: AnyObject) {

        let date = Date();
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        let defaultTimeZoneStr = formatter.string(from: date);
        let timestamp = formatter.string(from: date);
        print("submit time : \(timestamp)")
        
        for i in 1...23 {
        //for var i = 1; i <= 23; i += 1 {
            if (result[i]==0){
                Empty_Array.append(self.QestionCorrespondence[i])
            }
        }
        
        if (Empty_Array.count == 0){
            submitSCIMSelfReport("http://Localhost:8080/SCIM/SubmitSCIMSelfReport",timestamp: timestamp, userIDInput: userIDInput,result:result);
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
                self.submitSCIMSelfReport("http://Localhost:8080/SCIM/SubmitSCIMSelfReport",timestamp: timestamp, userIDInput: self.userIDInput,result:self.result);
                print("continue to submit")
            }
            
            alertOfEmpty_Alert.addAction(OkeyButton_AlertAction)
            alertOfEmpty_Alert.addAction(ContinueButton_AlertAction)
            present(alertOfEmpty_Alert, animated:true, completion: nil)
        }
        
        print("Empty_Array: \(Empty_Array)")
        Empty_Array = [];
    }
    
    
    var Time = 5;
    var Timer = Foundation.Timer()
    

    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
        print("Patient 1 userIDInput : \(userIDInput)")
        
        self.Q01S1_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        self.Q02S2A_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        self.Q03S2B_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
        self.Q04S3A_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell4")
        self.Q05S3B_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell5")
        self.Q06S4_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell6")
        self.Q07S5_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell7")
        self.Q08S6A_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell8")
        self.Q09S6B_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell9")
        self.Q10S6C_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell10")
        self.Q11S7A_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell11")
        self.Q12S7B_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell12")
        self.Q13S7C_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell13")
        self.Q14S8_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell14")
        self.Q15S9_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell15")
        self.Q16S10_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell16")
        self.Q17S11_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell17")
        self.Q18S12_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell18")
        self.Q19S13_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell19")
        self.Q20S14_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell20")
        self.Q21S15_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell21")
        self.Q22S16_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell22")
        self.Q23S17_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell23")
        
        
        
        

        self.Q01S1_TableView.dataSource = self
        self.Q02S2A_TableView.dataSource = self
        self.Q03S2B_TableView.dataSource = self
        self.Q04S3A_TableView.dataSource = self
        self.Q05S3B_TableView.dataSource = self
        self.Q06S4_TableView.dataSource = self
        self.Q07S5_TableView.dataSource = self
        self.Q08S6A_TableView.dataSource = self
        self.Q09S6B_TableView.dataSource = self
        self.Q10S6C_TableView.dataSource = self
        self.Q11S7A_TableView.dataSource = self
        self.Q12S7B_TableView.dataSource = self
        self.Q13S7C_TableView.dataSource = self
        self.Q14S8_TableView.dataSource = self
        self.Q15S9_TableView.dataSource = self
        self.Q16S10_TableView.dataSource = self
        self.Q17S11_TableView.dataSource = self
        self.Q18S12_TableView.dataSource = self
        self.Q19S13_TableView.dataSource = self
        self.Q20S14_TableView.dataSource = self
        self.Q21S15_TableView.dataSource = self
        self.Q22S16_TableView.dataSource = self
        self.Q23S17_TableView.dataSource = self
        
        
        
        
        
        
        
        Q01S1_TableView.delegate = self
        Q02S2A_TableView.delegate = self
        Q03S2B_TableView.delegate = self
        Q04S3A_TableView.delegate = self
        Q05S3B_TableView.delegate = self
        Q06S4_TableView.delegate = self
        Q07S5_TableView.delegate = self
        Q08S6A_TableView.delegate = self
        Q09S6B_TableView.delegate = self
        Q10S6C_TableView.delegate = self
        Q11S7A_TableView.delegate = self
        Q12S7B_TableView.delegate = self
        Q13S7C_TableView.delegate = self
        Q14S8_TableView.delegate = self
        Q15S9_TableView.delegate = self
        Q16S10_TableView.delegate = self
        Q17S11_TableView.delegate = self
        Q18S12_TableView.delegate = self
        Q19S13_TableView.delegate = self
        Q20S14_TableView.delegate = self
        Q21S15_TableView.delegate = self
        Q22S16_TableView.delegate = self
        Q23S17_TableView.delegate = self
        
        
        
        Q1_Array = ["\(A01S1_01_String)","\(A01S1_02_String)","\(A01S1_03_String)","\(A01S1_04_String)","\(A01S1_05_String)"]
        Q2_Array = ["\(A02S2A_01_String)","\(A02S2A_02_String)","\(A02S2A_03_String)","\(A02S2A_04_String)"]
        Q3_Array = ["\(A03S2B_01_String)","\(A03S2B_02_String)","\(A03S2B_03_String)","\(A03S2B_04_String)"]
        Q4_Array = ["\(A04S3A_01_String)","\(A04S3A_02_String)","\(A04S3A_03_String)","\(A04S3A_04_String)","\(A04S3A_05_String)"]
        Q5_Array = ["\(A05S3B_01_String)","\(A05S3B_02_String)","\(A05S3B_03_String)","\(A05S3B_04_String)","\(A05S3B_05_String)"]
        Q6_Array = ["\(A06S4_01_String)","\(A06S4_02_String)","\(A06S4_03_String)","\(A06S4_04_String)"]
        Q7_Array = ["\(A07S5_01_String)","\(A07S5_02_String)","\(A07S5_03_String)","\(A07S5_04_String)","\(A07S5_05_String)","\(A07S5_06_String)"]
        Q8_Array = ["\(A08S6A_01_String)","\(A08S6A_02_String)"]
        Q9_Array = ["\(A09S6B_01_String)","\(A09S6B_02_String)","\(A09S6B_03_String)","\(A09S6B_04_String)"]
        Q10_Array = ["\(A10S6C_01_String)","\(A10S6C_02_String)","\(A10S6C_03_String)","\(A10S6C_04_String)"]
        Q11_Array = ["\(A11S7A_01_String)","\(A11S7A_02_String)"]
        Q12_Array = ["\(A12S7B_01_String)","\(A12S7B_02_String)"]
        Q13_Array = ["\(A13S7C_01_String)","\(A13S7C_02_String)","\(A13S7C_03_String)"]
        Q14_Array = ["\(A14S8_01_String)","\(A14S8_02_String)","\(A14S8_03_String)","\(A14S8_04_String)","\(A14S8_05_String)"]
        Q15_Array = ["\(A15S9_01_String)","\(A15S9_02_String)","\(A15S9_03_String)","\(A15S9_04_String)"]
        Q16_Array = ["\(A16S10_01_String)","\(A16S10_02_String)","\(A16S10_03_String)","\(A16S10_04_String)"]
        Q17_Array = ["\(A17S11_01_String)","\(A17S11_02_String)","\(A17S11_03_String)","\(A17S11_04_String)"]
        Q18_Array = ["\(A18S12_01_String)","\(A18S12_02_String)","\(A18S12_03_String)","\(A18S12_04_String)","\(A18S12_05_String)","\(A18S12_06_String)","\(A18S12_07_String)","\(A18S12_08_String)","\(A18S12_09_String)"]
        Q19_Array = ["\(A19S13_01_String)","\(A19S13_02_String)","\(A19S13_03_String)","\(A19S13_04_String)","\(A19S13_05_String)","\(A19S13_06_String)","\(A19S13_07_String)","\(A19S13_08_String)","\(A19S13_09_String)"]
        Q20_Array = ["\(A20S14_01_String)","\(A20S14_02_String)","\(A20S14_03_String)","\(A20S14_04_String)","\(A20S14_05_String)","\(A20S14_06_String)","\(A20S14_07_String)","\(A20S14_08_String)","\(A20S14_09_String)"]
        Q21_Array = ["\(A21S15_01_String)","\(A21S15_02_String)","\(A21S15_03_String)","\(A21S15_04_String)"]
        Q22_Array = ["\(A22S16_01_String)","\(A22S16_02_String)","\(A22S16_03_String)","\(A22S16_04_String)"]
        Q23_Array = ["\(A23S17_01_String)","\(A23S17_02_String)","\(A23S17_03_String)"]


        
        SubmitSCIMSelfReport_Button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).cgColor as CGColor
        SubmitSCIMSelfReport_Button.layer.cornerRadius = 0.1 * SubmitSCIMSelfReport_Button.bounds.size.width
        

        self.myActivityIndicatorView.isHidden = true


        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, canEditingStyle editingStyle:UITableViewCellEditingStyle) -> Bool{
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows in the section.
       // return self.Q1_Array.count
        if tableView == Q01S1_TableView {
            return self.Q1_Array.count;
        } else if tableView == Q02S2A_TableView  {
            return self.Q2_Array.count;
        } else if tableView == Q03S2B_TableView {
            return self.Q3_Array.count;
        } else if tableView == Q04S3A_TableView {
            return self.Q4_Array.count;
        } else if tableView == Q05S3B_TableView{
            return self.Q5_Array.count;
        } else if tableView == Q06S4_TableView {
            return self.Q6_Array.count;
        } else if tableView == Q07S5_TableView {
            return self.Q7_Array.count;
        } else if tableView == Q08S6A_TableView{
            return self.Q8_Array.count;
        } else if tableView == Q09S6B_TableView{
            return self.Q9_Array.count;
        } else if tableView == Q10S6C_TableView{
            return self.Q10_Array.count;
        } else if tableView == Q11S7A_TableView{
            return self.Q11_Array.count;
        } else if tableView == Q12S7B_TableView{
            return self.Q12_Array.count;
        } else if tableView == Q13S7C_TableView{
            return self.Q13_Array.count;
        } else if tableView == Q14S8_TableView{
            return self.Q14_Array.count;
        } else if tableView == Q15S9_TableView{
            return self.Q15_Array.count;
        } else if tableView == Q16S10_TableView{
            return self.Q16_Array.count;
        } else if tableView == Q17S11_TableView{
            return self.Q17_Array.count;
        } else if tableView == Q18S12_TableView{
            return self.Q18_Array.count;
        } else if tableView == Q19S13_TableView{
            return self.Q19_Array.count;
        } else if tableView == Q20S14_TableView{
            return self.Q20_Array.count;
        } else if tableView == Q21S15_TableView{
            return self.Q21_Array.count;
        } else if tableView == Q22S16_TableView{
            return self.Q22_Array.count;
        } else{
            return self.Q23_Array.count;
        }




    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == Q01S1_TableView {
            let cell:UITableViewCell = self.Q01S1_TableView.dequeueReusableCell(withIdentifier: "cell1")! as     UITableViewCell
            cell.textLabel!.text = String(self.Q1_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q02S2A_TableView{
            let cell:UITableViewCell = self.Q02S2A_TableView.dequeueReusableCell(withIdentifier: "cell2")! as UITableViewCell
            cell.textLabel!.text = String(self.Q2_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q03S2B_TableView {
            let cell:UITableViewCell = self.Q03S2B_TableView.dequeueReusableCell(withIdentifier: "cell3")! as UITableViewCell
            cell.textLabel!.text = String(self.Q3_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q04S3A_TableView {
            let cell:UITableViewCell = self.Q04S3A_TableView.dequeueReusableCell(withIdentifier: "cell4")! as UITableViewCell
            cell.textLabel!.text = String(self.Q4_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q05S3B_TableView{
            let cell:UITableViewCell = self.Q05S3B_TableView.dequeueReusableCell(withIdentifier: "cell5")! as UITableViewCell
            cell.textLabel!.text = String(self.Q5_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q06S4_TableView{
            let cell:UITableViewCell = self.Q06S4_TableView.dequeueReusableCell(withIdentifier: "cell6")! as UITableViewCell
            cell.textLabel!.text = String(self.Q6_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q07S5_TableView{
            let cell:UITableViewCell = self.Q07S5_TableView.dequeueReusableCell(withIdentifier: "cell7")! as UITableViewCell
            cell.textLabel!.text = String(self.Q7_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q08S6A_TableView{
            let cell:UITableViewCell = self.Q08S6A_TableView.dequeueReusableCell(withIdentifier: "cell8")! as UITableViewCell
            cell.textLabel!.text = String(self.Q8_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q09S6B_TableView{
            let cell:UITableViewCell = self.Q09S6B_TableView.dequeueReusableCell(withIdentifier: "cell9")! as UITableViewCell
            cell.textLabel!.text = String(self.Q9_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q10S6C_TableView{
            let cell:UITableViewCell = self.Q10S6C_TableView.dequeueReusableCell(withIdentifier: "cell10")! as UITableViewCell
            cell.textLabel!.text = String(self.Q10_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q11S7A_TableView{
            let cell:UITableViewCell = self.Q11S7A_TableView.dequeueReusableCell(withIdentifier: "cell11")! as UITableViewCell
            cell.textLabel!.text = String(self.Q11_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q12S7B_TableView{
            let cell:UITableViewCell = self.Q12S7B_TableView.dequeueReusableCell(withIdentifier: "cell12")! as UITableViewCell
            cell.textLabel!.text = String(self.Q12_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q13S7C_TableView{
            let cell:UITableViewCell = self.Q13S7C_TableView.dequeueReusableCell(withIdentifier: "cell13")! as UITableViewCell
            cell.textLabel!.text = String(self.Q13_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q14S8_TableView{
            let cell:UITableViewCell = self.Q14S8_TableView.dequeueReusableCell(withIdentifier: "cell14")! as UITableViewCell
            cell.textLabel!.text = String(self.Q14_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q15S9_TableView{
            let cell:UITableViewCell = self.Q15S9_TableView.dequeueReusableCell(withIdentifier: "cell15")! as UITableViewCell
            cell.textLabel!.text = String(self.Q15_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q16S10_TableView{
            let cell:UITableViewCell = self.Q16S10_TableView.dequeueReusableCell(withIdentifier: "cell16")! as UITableViewCell
            cell.textLabel!.text = String(self.Q16_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        }  else if tableView == Q17S11_TableView{
            let cell:UITableViewCell = self.Q17S11_TableView.dequeueReusableCell(withIdentifier: "cell17")! as UITableViewCell
            cell.textLabel!.text = String(self.Q17_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q18S12_TableView{
            let cell:UITableViewCell = self.Q18S12_TableView.dequeueReusableCell(withIdentifier: "cell18")! as UITableViewCell
            cell.textLabel!.text = String(self.Q18_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q19S13_TableView{
            let cell:UITableViewCell = self.Q19S13_TableView.dequeueReusableCell(withIdentifier: "cell19")! as UITableViewCell
            cell.textLabel!.text = String(self.Q19_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q20S14_TableView{
            let cell:UITableViewCell = self.Q20S14_TableView.dequeueReusableCell(withIdentifier: "cell20")! as UITableViewCell
            cell.textLabel!.text = String(self.Q20_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q21S15_TableView{
            let cell:UITableViewCell = self.Q21S15_TableView.dequeueReusableCell(withIdentifier: "cell21")! as UITableViewCell
            cell.textLabel!.text = String(self.Q21_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else if tableView == Q22S16_TableView{
            let cell:UITableViewCell = self.Q22S16_TableView.dequeueReusableCell(withIdentifier: "cell22")! as UITableViewCell
            cell.textLabel!.text = String(self.Q22_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        } else {
            let cell:UITableViewCell = self.Q23S17_TableView.dequeueReusableCell(withIdentifier: "cell23")! as UITableViewCell
            cell.textLabel!.text = String(self.Q23_Array[indexPath.row])
            setCellStyle(cell)
            setTabelView(tableView)
            cell.tintColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
            return cell
        }


    }
    
    
    
    
    func tableView(_ tableView: UITableView!, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        let questionNumber = tableView.tag;
        let rowNumber = indexPath.row;

        if cell.accessoryType == UITableViewCellAccessoryType.checkmark{
            cell.accessoryType = UITableViewCellAccessoryType.none
            result[questionNumber]=0;
            print(result)
        } else {
            print("question is \(questionNumber) ")
            print("row is \(indexPath.row)")
            // if click row 0, means select answer 1, store int 1.
            result[questionNumber]=rowNumber+1;
            print(result)
            var arry=tableView.visibleCells;
            
            for index in 0...arry.count {
                let cells:UITableViewCell=arry[index] ;
                cells.accessoryType=UITableViewCellAccessoryType.none
            }
            cell.accessoryType=UITableViewCellAccessoryType.checkmark;
        }
        
        
    }
    

    func setCellStyle (_ cell:UITableViewCell) {
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping;
        cell.textLabel!.numberOfLines = 5;
        cell.textLabel!.font = UIFont(name:"Trebuchet MS", size:14)
        cell.textLabel!.textColor = UIColor.darkGray
    }
    
    func setTabelView (_ tableView: UITableView){
        tableView.estimatedRowHeight = 20.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    //  *** submit SCIM self-report  ***
    func submitSCIMSelfReport (_ urlString: String, timestamp: String, userIDInput: String, result: [Int]){
        print ("** Start func submitSCIMSelfReport **")
        
        self.myActivityIndicatorView.isHidden = false
        self.myActivityIndicatorView.startAnimating()
        self.Time = 5
        self.Timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PatientItem1ViewController.TimeOut), userInfo: nil, repeats: true)
        
        let url = URL(string: urlString)
        
        
        let request = NSMutableURLRequest(url:url!);
        request.httpMethod = "POST";
        let postString = "timestamp=\(timestamp)&userIDInput=\(userIDInput)&Q1AnsInput=\(result[1])&Q2AnsInput=\(result[2])&Q3AnsInput=\(result[3])&Q4AnsInput=\(result[4])&Q5AnsInput=\(result[5])&Q6AnsInput=\(result[6])&Q7AnsInput=\(result[7])&Q8AnsInput=\(result[8])&Q9AnsInput=\(result[9])&Q10AnsInput=\(result[10])&Q11AnsInput=\(result[11])&Q12AnsInput=\(result[12])&Q13AnsInput=\(result[13])&Q14AnsInput=\(result[14])&Q15AnsInput=\(result[15])&Q16AnsInput=\(result[16])&Q17AnsInput=\(result[17])&Q18AnsInput=\(result[18])&Q19AnsInput=\(result[19])&Q20AnsInput=\(result[20])&Q21AnsInput=\(result[21])&Q22AnsInput=\(result[22])&Q23AnsInput=\(result[23])";
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
    
    //  *** scroll view => the height can be changed if we need a longer view ***
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.myScrollView.frame = self.view.bounds
        self.myScrollView.contentSize.height = 6500
        self.myScrollView.contentSize.width = 0
        
    }
    
    //   *** STRING   ***
   // var Q01S1_String = "1. Eating and drinking";
   // var Q02S2A_String = "2A. Washing your upper body and head";
    //var Q03S2B_String = "2B. Washing your lower body";
    //var Q04S3A_String = "3A. Dressing your upper body"
    //var Q05S3B_String = "3B. Dressing your lower body"
    //var Q06S4_String = "4. Grooming"
    //var Q07S5_String = "5. Breathing"
    //var Q08S6A_String = "6A. Use of an indwelling catheter"
   // var Q09S6B_String = "6B. Intermittent catheterization"
    //var Q10S6C_String = "6C. Use of external drainage instruments (e.g., condom catheter, diapers, sanitary napkins)"
    //var Q11S7A_String = "7A. Do you need assistance with bowel management (e.g., for applying suppositories)?"
 //   var Q12S7B_String = "7B. My bowel movements arey"
  //  var Q13S7C_String = "7C. Fecal incontinence (‘accidents’) happens ..."
   // var Q14S8_String = "8. Using the toilet"
    //var Q15S9_String = "9. How many of the following four activities can you perform without assistance or electrical aids?"
//    var Q16S10_String = "10. Transfers from the bed to the wheelchair"
  //  var Q17S11_String = "11. Transfers from the wheelchair to the toilet/tub"
  //  var Q18S12_String = "12. Moving around indoors"
   // var Q19S13_String = "13.Moving around moderate distances (10 to 100 meters)"
    //var Q20S14_String = "14. Moving around outdoors for more than 100 meters"
   // var Q21S15_String = "15. Going up or down stairs"
    //var Q22S16_String = "16. Transfers from the wheelchair into the car"
    //var Q23S17_String = "17. Transfers from the floor to the wheelchair"
    
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
