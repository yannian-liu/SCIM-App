//
//  Admin2ViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/24.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class Admin2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userIDInput = String()
    
    @IBOutlet weak var SCIM_ScrollView: UIScrollView!
    @IBOutlet weak var QOL_ScrollView: UIScrollView!
    
    //   *** STRING   ***
     let Q01S1_String = "1. Eating and drinking";
     let Q02S2A_String = "2A. Washing your upper body and head";
    let Q03S2B_String = "2B. Washing your lower body";
    let Q04S3A_String = "3A. Dressing your upper body"
    let Q05S3B_String = "3B. Dressing your lower body"
    let Q06S4_String = "4. Grooming"
    let Q07S5_String = "5. Breathing"
    let Q08S6A_String = "6A. Use of an indwelling catheter"
     let Q09S6B_String = "6B. Intermittent catheterization"
    let Q10S6C_String = "6C. Use of external drainage instruments (e.g., condom catheter, diapers, sanitary napkins)"
    let Q11S7A_String = "7A. Do you need assistance with bowel management (e.g., for applying suppositories)?"
       let Q12S7B_String = "7B. My bowel movements arey"
      let Q13S7C_String = "7C. Fecal incontinence (‘accidents’) happens ..."
     let Q14S8_String = "8. Using the toilet"
    let Q15S9_String = "9. How many of the following four activities can you perform without assistance or electrical aids?"
        let Q16S10_String = "10. Transfers from the bed to the wheelchair"
      let Q17S11_String = "11. Transfers from the wheelchair to the toilet/tub"
      let Q18S12_String = "12. Moving around indoors"
     let Q19S13_String = "13.Moving around moderate distances (10 to 100 meters)"
    let Q20S14_String = "14. Moving around outdoors for more than 100 meters"
     let Q21S15_String = "15. Going up or down stairs"
    let Q22S16_String = "16. Transfers from the wheelchair into the car"
    let Q23S17_String = "17. Transfers from the floor to the wheelchair"
    
    let Q1_String = "Q1 Thinking about your own life and personal circumstances, how satisfied are you with your life as a whole in the past four weeks?"
    let Q2_String = "Q2 How satisfied are you with your physical health in the past four weeks?"
    let Q3_String = "Q3 How satisfied are you with your psychological health, emotions and mood in the past four weeks?"
    
    //++++++++++++++++ Answer++++++++//
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
    
    
    var SCIMQ1_Array = [String]()
    var SCIMQ2_Array = [String]()
    var SCIMQ3_Array = [String]()
    var SCIMQ4_Array = [String]()
    var SCIMQ5_Array = [String]()
    var SCIMQ6_Array = [String]()
    var SCIMQ7_Array = [String]()
    var SCIMQ8_Array = [String]()
    var SCIMQ9_Array = [String]()
    var SCIMQ10_Array = [String]()
    var SCIMQ11_Array = [String]()
    var SCIMQ12_Array = [String]()
    var SCIMQ13_Array = [String]()
    var SCIMQ14_Array = [String]()
    var SCIMQ15_Array = [String]()
    var SCIMQ16_Array = [String]()
    var SCIMQ17_Array = [String]()
    var SCIMQ18_Array = [String]()
    var SCIMQ19_Array = [String]()
    var SCIMQ20_Array = [String]()
    var SCIMQ21_Array = [String]()
    var SCIMQ22_Array = [String]()
    var SCIMQ23_Array = [String]()

    var SCIMAnswerArray_Array = [[String()]]
    var QOLAnswerArray_Array = [[String()]]
    
    @IBOutlet weak var SCIMHistory_TableView: UITableView!
    var SCIMQuestionShow_Array = [String]()
    var SCIMQuestionName_Array : [String] = ["Q01S1","Q02S2A","Q03S2B","Q04S3A","Q05S3B","Q06S4","Q07S5","Q08S6A","Q09S6B","Q10S6C","Q11S7A","Q12S7B","Q13S7C","Q14S8","Q15S9","Q16S10","Q17S11","Q18S12","Q19S13","Q20S14","Q21S15","Q22S16","Q23S17"]
    var SCIMAnswerQuantity_Array : [Int] = [5,4,4,5,5,4,6,2,4,4,2,2,3,5,4,4,4,9,9,9,4,4,3]
    
    @IBOutlet weak var QOLHistory_TableView: UITableView!
    var QOLQuestionShow_Array = [String]()
    var QOLQuestionName_Array : [String] = ["Q1","Q2","Q3"]
    var QOLAnswerQuantity_Array : [Int] = [11,11,11]
    
    var SelectedQuestionName_String = String()
    var SelectedQustionContent_String = String()
    var SelectedAnswerQuantity_Int = Int()
    var SelectedAnswer_Array = [String()]
    var SelectedQuestionType = String()
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBAction func mySegmentedControlAction(_ sender: AnyObject) {
        
        let SCIMBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.SCIM_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let QOLBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.QOL_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        
        if sender.selectedSegmentIndex == 0{
            SCIMHistory_TableView.isHidden = false
            SCIM_ScrollView.isHidden = false
            
            QOLHistory_TableView.isHidden = true
            QOL_ScrollView.isHidden = true
            
            
            self.view.removeConstraint(QOLBottomConstraint)
            self.view.addConstraint(SCIMBottomConstraint)
        }else {
            SCIMHistory_TableView.isHidden = true
            SCIM_ScrollView.isHidden = true

            QOLHistory_TableView.isHidden = false
            QOL_ScrollView.isHidden = false
            
            self.view.removeConstraint(SCIMBottomConstraint)
            self.view.addConstraint(QOLBottomConstraint)
            
        }
    }

    
    //@IBOutlet weak var SCIMHistoryTableViewHeight_Constraint: NSLayoutConstraint!
   // @IBOutlet weak var QOLHistoryTableViewHeight_Constraint: NSLayoutConstraint!

    var SCIMlastCellBottom = Float()
    override func viewDidLoad() {
        super.viewDidLoad()

        print (" ~~~ admin 2 ~~~ \n userIDInput: \(userIDInput)")
        SCIMQuestionShow_Array = [Q01S1_String,Q02S2A_String,Q03S2B_String,Q04S3A_String,Q05S3B_String,Q06S4_String,Q07S5_String,Q08S6A_String,Q09S6B_String,Q10S6C_String,Q11S7A_String,Q12S7B_String,Q13S7C_String,Q14S8_String,Q15S9_String,Q16S10_String,Q17S11_String,Q18S12_String,Q19S13_String,Q20S14_String,Q21S15_String,Q22S16_String,Q23S17_String]
        
        SCIMQ1_Array = ["\(A01S1_01_String)","\(A01S1_02_String)","\(A01S1_03_String)","\(A01S1_04_String)","\(A01S1_05_String)"]
        SCIMQ2_Array = ["\(A02S2A_01_String)","\(A02S2A_02_String)","\(A02S2A_03_String)","\(A02S2A_04_String)"]
        SCIMQ3_Array = ["\(A03S2B_01_String)","\(A03S2B_02_String)","\(A03S2B_03_String)","\(A03S2B_04_String)"]
        SCIMQ4_Array = ["\(A04S3A_01_String)","\(A04S3A_02_String)","\(A04S3A_03_String)","\(A04S3A_04_String)","\(A04S3A_05_String)"]
        SCIMQ5_Array = ["\(A05S3B_01_String)","\(A05S3B_02_String)","\(A05S3B_03_String)","\(A05S3B_04_String)","\(A05S3B_05_String)"]
        SCIMQ6_Array = ["\(A06S4_01_String)","\(A06S4_02_String)","\(A06S4_03_String)","\(A06S4_04_String)"]
        SCIMQ7_Array = ["\(A07S5_01_String)","\(A07S5_02_String)","\(A07S5_03_String)","\(A07S5_04_String)","\(A07S5_05_String)","\(A07S5_06_String)"]
        SCIMQ8_Array = ["\(A08S6A_01_String)","\(A08S6A_02_String)"]
        SCIMQ9_Array = ["\(A09S6B_01_String)","\(A09S6B_02_String)","\(A09S6B_03_String)","\(A09S6B_04_String)"]
        SCIMQ10_Array = ["\(A10S6C_01_String)","\(A10S6C_02_String)","\(A10S6C_03_String)","\(A10S6C_04_String)"]
        SCIMQ11_Array = ["\(A11S7A_01_String)","\(A11S7A_02_String)"]
        SCIMQ12_Array = ["\(A12S7B_01_String)","\(A12S7B_02_String)"]
        SCIMQ13_Array = ["\(A13S7C_01_String)","\(A13S7C_02_String)","\(A13S7C_03_String)"]
        SCIMQ14_Array = ["\(A14S8_01_String)","\(A14S8_02_String)","\(A14S8_03_String)","\(A14S8_04_String)","\(A14S8_05_String)"]
        SCIMQ15_Array = ["\(A15S9_01_String)","\(A15S9_02_String)","\(A15S9_03_String)","\(A15S9_04_String)"]
        SCIMQ16_Array = ["\(A16S10_01_String)","\(A16S10_02_String)","\(A16S10_03_String)","\(A16S10_04_String)"]
        SCIMQ17_Array = ["\(A17S11_01_String)","\(A17S11_02_String)","\(A17S11_03_String)","\(A17S11_04_String)"]
        SCIMQ18_Array = ["\(A18S12_01_String)","\(A18S12_02_String)","\(A18S12_03_String)","\(A18S12_04_String)","\(A18S12_05_String)","\(A18S12_06_String)","\(A18S12_07_String)","\(A18S12_08_String)","\(A18S12_09_String)"]
        SCIMQ19_Array = ["\(A19S13_01_String)","\(A19S13_02_String)","\(A19S13_03_String)","\(A19S13_04_String)","\(A19S13_05_String)","\(A19S13_06_String)","\(A19S13_07_String)","\(A19S13_08_String)","\(A19S13_09_String)"]
        SCIMQ20_Array = ["\(A20S14_01_String)","\(A20S14_02_String)","\(A20S14_03_String)","\(A20S14_04_String)","\(A20S14_05_String)","\(A20S14_06_String)","\(A20S14_07_String)","\(A20S14_08_String)","\(A20S14_09_String)"]
        SCIMQ21_Array = ["\(A21S15_01_String)","\(A21S15_02_String)","\(A21S15_03_String)","\(A21S15_04_String)"]
        SCIMQ22_Array = ["\(A22S16_01_String)","\(A22S16_02_String)","\(A22S16_03_String)","\(A22S16_04_String)"]
        SCIMQ23_Array = ["\(A23S17_01_String)","\(A23S17_02_String)","\(A23S17_03_String)"]
        
        
        SCIMAnswerArray_Array = [SCIMQ1_Array,SCIMQ2_Array,SCIMQ3_Array,SCIMQ4_Array,SCIMQ5_Array,SCIMQ6_Array,SCIMQ7_Array,SCIMQ8_Array,SCIMQ9_Array,SCIMQ10_Array,SCIMQ11_Array,SCIMQ12_Array,SCIMQ13_Array,SCIMQ14_Array,SCIMQ15_Array,SCIMQ16_Array,SCIMQ17_Array,SCIMQ18_Array,SCIMQ19_Array,SCIMQ20_Array,SCIMQ21_Array,SCIMQ22_Array,SCIMQ23_Array]

        
        QOLQuestionShow_Array = [Q1_String,Q2_String,Q3_String]

        QOLAnswerArray_Array = [["0","1","2","3","4","5","6","7","8","9","10"],["0","1","2","3","4","5","6","7","8","9","10"],["0","1","2","3","4","5","6","7","8","9","10"]]
        
        SCIMHistory_TableView.isHidden = false
        QOLHistory_TableView.isHidden = true
        
        self.SCIMHistory_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        self.SCIMHistory_TableView.dataSource = self
        SCIMHistory_TableView.delegate = self
        
        self.QOLHistory_TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        self.QOLHistory_TableView.dataSource = self
        QOLHistory_TableView.delegate = self
        
        mySegmentedControl.setTitleTextAttributes([NSFontAttributeName: UIFont(name:"Trebuchet MS", size:14)!], for: UIControlState())
        
        SCIMHistory_TableView.isHidden = false
        SCIM_ScrollView.isHidden = false
        QOL_ScrollView.isHidden = true
        QOLHistory_TableView.isHidden = true
        
        SCIM_ScrollView.contentSize.height = 1000
        QOL_ScrollView.contentSize.height = 1000
        
        //self.QOLHistoryTableViewHeight_Constraint.constant = CGFloat(self.QOLdateAndTime_Array.count-9) * 44
        
        
        DispatchQueue.main.async(execute: {

            self.SCIM_ScrollView.contentSize.height = self.SCIMHistory_TableView.frame.height+20
            self.QOL_ScrollView.contentSize.height = self.QOLHistory_TableView.frame.height+20
            
           
            let SCIMBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .top, relatedBy: .equal, toItem: self.SCIM_ScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            self.view.addConstraint(SCIMBottomConstraint)
           // self.SCIMHistory_TableView.reloadData()
            
            //print(self.QOLHistoryTableViewHeight_Constraint)
//            self.SCIMHistoryTableViewHeight_Constraint.constant = CGFloat(23*44)
//            print("SCIMdateAndTime_Array.count: \(self.SCIMdateAndTime_Array.count)")
//            self.SCIM_ScrollView.contentSize.height = CGFloat(23 * 44 + 60)
//            
//            
//            self.QOLHistoryTableViewHeight_Constraint.constant = CGFloat((self.QOLdateAndTime_Array.count-5) * 44)
//            print(self.QOLdateAndTime_Array.count)
//            self.QOL_ScrollView.contentSize.height = CGFloat((self.QOLdateAndTime_Array.count-5)  * 44 + 60)
// 
//            var SCIMBottomConstraint = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .Top, relatedBy: .Equal, toItem: self.SCIM_ScrollView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
//            self.view.addConstraint(SCIMBottomConstraint)
//            self.SCIMHistory_TableView.reloadData()
//            self.QOLHistory_TableView.reloadData()
//            
            })

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
        if tableView == SCIMHistory_TableView{
            return self.SCIMQuestionShow_Array.count
        }else {
            return self.QOLQuestionShow_Array.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == SCIMHistory_TableView{
            let cell:UITableViewCell = self.SCIMHistory_TableView.dequeueReusableCell(withIdentifier: "cell1")! as     UITableViewCell
            cell.textLabel!.text = String(self.SCIMQuestionShow_Array[indexPath.row])
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            setCellStyle(cell)
            setTabelView(tableView)
            return cell
            
        }else{
            let cell:UITableViewCell = self.QOLHistory_TableView.dequeueReusableCell(withIdentifier: "cell2")! as     UITableViewCell
            cell.textLabel!.text = String(self.QOLQuestionShow_Array[indexPath.row])
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            setCellStyle(cell)
            setTabelView(tableView)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView!, didSelectRowAt indexPath: IndexPath) {
        if tableView == SCIMHistory_TableView {
            SelectedQuestionName_String = SCIMQuestionName_Array[indexPath.row]
            SelectedQustionContent_String = SCIMQuestionShow_Array[indexPath.row]
            SelectedAnswerQuantity_Int = SCIMAnswerQuantity_Array[indexPath.row]
            SelectedAnswer_Array = SCIMAnswerArray_Array[indexPath.row]
            SelectedQuestionType = "SCIMSelfReportResponse"
            
            print("select question name \(SelectedQuestionName_String)")
            print("select question content \(SelectedQustionContent_String)")
            print("answer quantity \(SelectedAnswerQuantity_Int)")
            print("answers \(SelectedAnswer_Array)")
            
            performSegue(withIdentifier: "ShowOneDiagramAdmin_Segue", sender: self)

        }
        else{
            SelectedQuestionName_String = QOLQuestionName_Array[indexPath.row]
            SelectedQustionContent_String = QOLQuestionShow_Array[indexPath.row]
            SelectedAnswerQuantity_Int = QOLAnswerQuantity_Array[indexPath.row]
            SelectedAnswer_Array = QOLAnswerArray_Array[indexPath.row]
            SelectedQuestionType = "QualityOfLifeResponse"
            
            print("select question name \(SelectedQuestionName_String)")
            print("select question content \(SelectedQustionContent_String)")
            print("answer quantity \(SelectedAnswerQuantity_Int)")
            print("answers \(SelectedAnswer_Array)")
            
            performSegue(withIdentifier: "ShowOneDiagramAdmin_Segue", sender: self)
        }
    }
    func setCellStyle (_ cell:UITableViewCell) {
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping;
        cell.textLabel!.numberOfLines = 5;
        cell.textLabel!.font = UIFont(name:"Trebuchet MS", size:14)
        cell.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
        cell.textLabel!.textColor = UIColor.white
        
    }
    
    func setTabelView (_ tableView: UITableView){
        tableView.estimatedRowHeight = 20.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "ShowOneDiagramAdmin_Segue") {
            let DestViewController : OneDiagramViewController = segue.destination as!OneDiagramViewController
            DestViewController.QuestionName_String = self.SelectedQuestionName_String;
            DestViewController.QuestionContent_String = self.SelectedQustionContent_String
            DestViewController.AnswerQuantity_Int = self.SelectedAnswerQuantity_Int;
            DestViewController.Answer_Array = self.SelectedAnswer_Array
            DestViewController.QuestionType_String = self.SelectedQuestionType
            
            
        }
    }

    
}
