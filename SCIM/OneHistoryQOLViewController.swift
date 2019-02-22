//
//  OneHistoryQOLViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/13.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class OneHistoryQOLViewController: UIViewController {
    var userIDInput = String()
    var QOLresponseID = Int()
    var QOLdateAndTime = String()
    var Q1 = Int()
    var Q2 = Int()
    var Q3 = Int()
    
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

    
    @IBOutlet weak var dateAndTime_Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Do any additional setup after loading the view.
        
        switch (Q1){
            case 0: setSelectedAnswer(Q1A0_Button); break
            case 1: setSelectedAnswer(Q1A1_Button); break
            case 2: setSelectedAnswer(Q1A2_Button); break
            case 3: setSelectedAnswer(Q1A3_Button); break
            case 4: setSelectedAnswer(Q1A4_Button); break
            case 5: setSelectedAnswer(Q1A5_Button); break
            case 6: setSelectedAnswer(Q1A6_Button); break
            case 7: setSelectedAnswer(Q1A7_Button); break
            case 8: setSelectedAnswer(Q1A8_Button); break
            case 9: setSelectedAnswer(Q1A9_Button); break
            case 10: setSelectedAnswer(Q1A10_Button); break
            default:  break
        }
        switch (Q2){
        case 0: setSelectedAnswer(Q2A0_Button); break
        case 1: setSelectedAnswer(Q2A1_Button); break
        case 2: setSelectedAnswer(Q2A2_Button); break
        case 3: setSelectedAnswer(Q2A3_Button); break
        case 4: setSelectedAnswer(Q2A4_Button); break
        case 5: setSelectedAnswer(Q2A5_Button); break
        case 6: setSelectedAnswer(Q2A6_Button); break
        case 7: setSelectedAnswer(Q2A7_Button); break
        case 8: setSelectedAnswer(Q2A8_Button); break
        case 9: setSelectedAnswer(Q2A9_Button); break
        case 10: setSelectedAnswer(Q2A10_Button); break
        default:  break
        }
        switch (Q3){
        case 0: setSelectedAnswer(Q3A0_Button); break
        case 1: setSelectedAnswer(Q3A1_Button); break
        case 2: setSelectedAnswer(Q3A2_Button); break
        case 3: setSelectedAnswer(Q3A3_Button); break
        case 4: setSelectedAnswer(Q3A4_Button); break
        case 5: setSelectedAnswer(Q3A5_Button); break
        case 6: setSelectedAnswer(Q3A6_Button); break
        case 7: setSelectedAnswer(Q3A7_Button); break
        case 8: setSelectedAnswer(Q3A8_Button); break
        case 9: setSelectedAnswer(Q3A9_Button); break
        case 10: setSelectedAnswer(Q3A10_Button); break
        default:  break
        }
        
        self.navigationItem.title = "QOL HISTORY"
        dateAndTime_Label.text = "Submitting Time : \(QOLdateAndTime)"
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
    
    func setSelectedAnswer (_ button:UIButton){
        button.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:0.5).cgColor as CGColor
  
    }
    

}
