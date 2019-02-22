//
//  ValueViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/11.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class OneHistorySCIMViewController: UIViewController {
    var userIDInput = String()
    var SCIMresponseID = Int()
    var SCIMdateAndTime = String()
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
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var A01S1_01_Label: UILabel!
    @IBOutlet weak var A01S1_02_Label: UILabel!
    @IBOutlet weak var A01S1_03_Label: UILabel!
    @IBOutlet weak var A01S1_04_Label: UILabel!
    @IBOutlet weak var A01S1_05_Label: UILabel!
    
    @IBOutlet weak var A02S2A_01_Label: UILabel!
    @IBOutlet weak var A02S2A_02_Label: UILabel!
    @IBOutlet weak var A02S2A_03_Label: UILabel!
    @IBOutlet weak var A02S2A_04_Label: UILabel!
    
    @IBOutlet weak var A03S2B_01_Label: UILabel!
    @IBOutlet weak var A03S2B_02_Label: UILabel!
    @IBOutlet weak var A03S2B_03_Label: UILabel!
    @IBOutlet weak var A03S2B_04_Label: UILabel!
    
    @IBOutlet weak var A04S3A_01_Label: UILabel!
    @IBOutlet weak var A04S3A_02_Label: UILabel!
    @IBOutlet weak var A04S3A_03_Label: UILabel!
    @IBOutlet weak var A04S3A_04_Label: UILabel!
    @IBOutlet weak var A04S3A_05_Label: UILabel!
    
    @IBOutlet weak var A05S3B_01_Label: UILabel!
    @IBOutlet weak var A05S3B_02_Label: UILabel!
    @IBOutlet weak var A05S3B_03_Label: UILabel!
    @IBOutlet weak var A05S3B_04_Label: UILabel!
    @IBOutlet weak var A05S3B_05_Label: UILabel!
    
    @IBOutlet weak var A06S4_01_Label: UILabel!
    @IBOutlet weak var A06S4_02_Label: UILabel!
    @IBOutlet weak var A06S4_03_Label: UILabel!
    @IBOutlet weak var A06S4_04_Label: UILabel!
    
    @IBOutlet weak var A07S5_01_Label: UILabel!
    @IBOutlet weak var A07S5_02_Label: UILabel!
    @IBOutlet weak var A07S5_03_Label: UILabel!
    @IBOutlet weak var A07S5_04_Label: UILabel!
    @IBOutlet weak var A07S5_05_Label: UILabel!
    @IBOutlet weak var A07S5_06_Label: UILabel!
    
    
    @IBOutlet weak var A08S6A_01_Label: UILabel!
    @IBOutlet weak var A08S6A_02_Label: UILabel!
    
    
    @IBOutlet weak var A09S6B_01_Label: UILabel!
    @IBOutlet weak var A09S6B_02_Label: UILabel!
    @IBOutlet weak var A09S6B_03_Label: UILabel!
    @IBOutlet weak var A09S6B_04_Label: UILabel!

    @IBOutlet weak var A10S6C_01_Label: UILabel!
    @IBOutlet weak var A10S6C_02_Label: UILabel!
    @IBOutlet weak var A10S6C_03_Label: UILabel!
    @IBOutlet weak var A10S6C_04_Label: UILabel!
    
    @IBOutlet weak var A11S7A_01_Label: UILabel!
    @IBOutlet weak var A11S7A_02_Label: UILabel!
    
    @IBOutlet weak var A12S7B_01_Label: UILabel!
    @IBOutlet weak var A12S7B_02_Label: UILabel!
    
    @IBOutlet weak var A13S7C_01_Label: UILabel!
    @IBOutlet weak var A13S7C_02_Label: UILabel!
    @IBOutlet weak var A13S7C_03_Label: UILabel!
    

    @IBOutlet weak var A14S8_01_Label: UILabel!
    @IBOutlet weak var A14S8_02_Label: UILabel!
    @IBOutlet weak var A14S8_03_Label: UILabel!
    @IBOutlet weak var A14S8_04_Label: UILabel!
    @IBOutlet weak var A14S8_05_Label: UILabel!
    
    @IBOutlet weak var A15S9_01_Label: UILabel!
    @IBOutlet weak var A15S9_02_Label: UILabel!
    @IBOutlet weak var A15S9_03_Label: UILabel!
    @IBOutlet weak var A15S9_04_Label: UILabel!
    
    @IBOutlet weak var A16S10_01_Label: UILabel!
    @IBOutlet weak var A16S10_02_Label: UILabel!
    @IBOutlet weak var A16S10_03_Label: UILabel!
    @IBOutlet weak var A16S10_04_Label: UILabel!
    
    @IBOutlet weak var A17S11_01_Label: UILabel!
    @IBOutlet weak var A17S11_02_Label: UILabel!
    @IBOutlet weak var A17S11_03_Label: UILabel!
    @IBOutlet weak var A17S11_04_Label: UILabel!
    
    @IBOutlet weak var A18S12_01_Label: UILabel!
    @IBOutlet weak var A18S12_02_Label: UILabel!
    @IBOutlet weak var A18S12_03_Label: UILabel!
    @IBOutlet weak var A18S12_04_Label: UILabel!
    @IBOutlet weak var A18S12_05_Label: UILabel!
    @IBOutlet weak var A18S12_06_Label: UILabel!
    @IBOutlet weak var A18S12_07_Label: UILabel!
    @IBOutlet weak var A18S12_08_Label: UILabel!
    @IBOutlet weak var A18S12_09_Label: UILabel!
    
    @IBOutlet weak var A19S13_01_Label: UILabel!
    @IBOutlet weak var A19S13_02_Label: UILabel!
    @IBOutlet weak var A19S13_03_Label: UILabel!
    @IBOutlet weak var A19S13_04_Label: UILabel!
    @IBOutlet weak var A19S13_05_Label: UILabel!
    @IBOutlet weak var A19S13_06_Label: UILabel!
    @IBOutlet weak var A19S13_07_Label: UILabel!
    @IBOutlet weak var A19S13_08_Label: UILabel!
    @IBOutlet weak var A19S13_09_Label: UILabel!
    
    @IBOutlet weak var A20S14_01_Label: UILabel!
    @IBOutlet weak var A20S14_02_Label: UILabel!
    @IBOutlet weak var A20S14_03_Label: UILabel!
    @IBOutlet weak var A20S14_04_Label: UILabel!
    @IBOutlet weak var A20S14_05_Label: UILabel!
    @IBOutlet weak var A20S14_06_Label: UILabel!
    @IBOutlet weak var A20S14_07_Label: UILabel!
    @IBOutlet weak var A20S14_08_Label: UILabel!
    @IBOutlet weak var A20S14_09_Label: UILabel!
    
    @IBOutlet weak var A21S15_01_Label: UILabel!
    @IBOutlet weak var A21S15_02_Label: UILabel!
    @IBOutlet weak var A21S15_03_Label: UILabel!
    @IBOutlet weak var A21S15_04_Label: UILabel!
    
    @IBOutlet weak var A22S16_01_Label: UILabel!
    @IBOutlet weak var A22S16_02_Label: UILabel!
    @IBOutlet weak var A22S16_03_Label: UILabel!
    @IBOutlet weak var A22S16_04_Label: UILabel!
    
    @IBOutlet weak var A23S17_01_Label: UILabel!
    @IBOutlet weak var A23S17_02_Label: UILabel!
    @IBOutlet weak var A23S17_03_Label: UILabel!
    
    @IBOutlet weak var dateAndTime_Label: UILabel!
    
    
    @IBOutlet weak var LayoutBottom_Constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
        
        dateAndTime_Label.text = SCIMdateAndTime
        
        switch (Q01S1){
            case 1: setSelectedAnswer(A01S1_01_Label); break
            case 2: setSelectedAnswer(A01S1_02_Label); break
            case 3: setSelectedAnswer(A01S1_03_Label); break
            case 4: setSelectedAnswer(A01S1_04_Label); break
            case 5: setSelectedAnswer(A01S1_05_Label); break
           default:  break
        }
        switch (Q02S2A){
        case 1: setSelectedAnswer(A02S2A_01_Label); break
        case 2: setSelectedAnswer(A02S2A_02_Label); break
        case 3: setSelectedAnswer(A02S2A_03_Label); break
        case 4: setSelectedAnswer(A02S2A_04_Label); break
        default:  break
        }
        switch (Q03S2B){
        case 1: setSelectedAnswer(A03S2B_01_Label); break
        case 2: setSelectedAnswer(A03S2B_02_Label); break
        case 3: setSelectedAnswer(A03S2B_03_Label); break
        case 4: setSelectedAnswer(A03S2B_04_Label); break
        default:  break
        }
        switch (Q04S3A){
        case 1: setSelectedAnswer(A04S3A_01_Label); break
        case 2: setSelectedAnswer(A04S3A_02_Label); break
        case 3: setSelectedAnswer(A04S3A_03_Label); break
        case 4: setSelectedAnswer(A04S3A_04_Label); break
        case 5: setSelectedAnswer(A04S3A_05_Label); break
        default:  break
        }
        switch (Q05S3B){
        case 1: setSelectedAnswer(A05S3B_01_Label); break
        case 2: setSelectedAnswer(A05S3B_02_Label); break
        case 3: setSelectedAnswer(A05S3B_03_Label); break
        case 4: setSelectedAnswer(A05S3B_04_Label); break
        case 5: setSelectedAnswer(A05S3B_05_Label); break
        default:  break
        }
        switch (Q06S4){
        case 1: setSelectedAnswer(A06S4_01_Label); break
        case 2: setSelectedAnswer(A06S4_02_Label); break
        case 3: setSelectedAnswer(A06S4_03_Label); break
        case 4: setSelectedAnswer(A06S4_04_Label); break
        default:  break
        }
        switch (Q07S5){
        case 1: setSelectedAnswer(A07S5_01_Label); break
        case 2: setSelectedAnswer(A07S5_02_Label); break
        case 3: setSelectedAnswer(A07S5_03_Label); break
        case 4: setSelectedAnswer(A07S5_04_Label); break
        case 5: setSelectedAnswer(A07S5_05_Label); break
        case 6: setSelectedAnswer(A07S5_06_Label); break
        default:  break
        }
        switch (Q08S6A){
        case 1: setSelectedAnswer(A08S6A_01_Label); break
        case 2: setSelectedAnswer(A08S6A_02_Label); break
        default:  break
        }
        switch (Q09S6B){
        case 1: setSelectedAnswer(A09S6B_01_Label); break
        case 2: setSelectedAnswer(A09S6B_02_Label); break
        case 3: setSelectedAnswer(A09S6B_03_Label); break
        case 4: setSelectedAnswer(A09S6B_04_Label); break
        default:  break
        }
        switch (Q10S6C){
        case 1: setSelectedAnswer(A10S6C_01_Label); break
        case 2: setSelectedAnswer(A10S6C_02_Label); break
        case 3: setSelectedAnswer(A10S6C_03_Label); break
        case 4: setSelectedAnswer(A10S6C_04_Label); break
        default:  break
        }
        switch (Q11S7A){
        case 1: setSelectedAnswer(A11S7A_01_Label); break
        case 2: setSelectedAnswer(A11S7A_02_Label); break
        default:  break
        }
        switch (Q12S7B){
        case 1: setSelectedAnswer(A12S7B_01_Label); break
        case 2: setSelectedAnswer(A12S7B_02_Label); break
        default:  break
        }
        switch (Q13S7C){
        case 1: setSelectedAnswer(A13S7C_01_Label); break
        case 2: setSelectedAnswer(A13S7C_02_Label); break
        case 3: setSelectedAnswer(A13S7C_03_Label); break
        default:  break
        }
        switch (Q14S8){
        case 1: setSelectedAnswer(A14S8_01_Label); break
        case 2: setSelectedAnswer(A14S8_02_Label); break
        case 3: setSelectedAnswer(A14S8_03_Label); break
        case 4: setSelectedAnswer(A14S8_04_Label); break
        case 5: setSelectedAnswer(A14S8_05_Label); break
        default:  break
        }
        switch (Q15S9){
        case 1: setSelectedAnswer(A15S9_01_Label); break
        case 2: setSelectedAnswer(A15S9_02_Label); break
        case 3: setSelectedAnswer(A15S9_03_Label); break
        case 4: setSelectedAnswer(A15S9_04_Label); break
        default:  break
        }
        switch (Q16S10){
        case 1: setSelectedAnswer(A16S10_01_Label); break
        case 2: setSelectedAnswer(A16S10_02_Label); break
        case 3: setSelectedAnswer(A16S10_03_Label); break
        case 4: setSelectedAnswer(A16S10_04_Label); break
        default:  break
        }
        switch (Q17S11){
        case 1: setSelectedAnswer(A17S11_01_Label); break
        case 2: setSelectedAnswer(A17S11_02_Label); break
        case 3: setSelectedAnswer(A17S11_03_Label); break
        case 4: setSelectedAnswer(A17S11_04_Label); break
        default:  break
        }
        switch (Q18S12){
        case 1: setSelectedAnswer(A18S12_01_Label); break
        case 2: setSelectedAnswer(A18S12_02_Label); break
        case 3: setSelectedAnswer(A18S12_03_Label); break
        case 4: setSelectedAnswer(A18S12_04_Label); break
        case 5: setSelectedAnswer(A18S12_05_Label); break
        case 6: setSelectedAnswer(A18S12_06_Label); break
        case 7: setSelectedAnswer(A18S12_07_Label); break
        case 8: setSelectedAnswer(A18S12_08_Label); break
        case 9: setSelectedAnswer(A18S12_09_Label); break
        default:  break
        }
        switch (Q19S13){
        case 1: setSelectedAnswer(A19S13_01_Label); break
        case 2: setSelectedAnswer(A19S13_02_Label); break
        case 3: setSelectedAnswer(A19S13_03_Label); break
        case 4: setSelectedAnswer(A19S13_04_Label); break
        case 5: setSelectedAnswer(A19S13_05_Label); break
        case 6: setSelectedAnswer(A19S13_06_Label); break
        case 7: setSelectedAnswer(A19S13_07_Label); break
        case 8: setSelectedAnswer(A19S13_08_Label); break
        case 9: setSelectedAnswer(A19S13_09_Label); break
        default:  break
        }
        switch (Q20S14){
        case 1: setSelectedAnswer(A20S14_01_Label); break
        case 2: setSelectedAnswer(A20S14_02_Label); break
        case 3: setSelectedAnswer(A20S14_03_Label); break
        case 4: setSelectedAnswer(A20S14_04_Label); break
        case 5: setSelectedAnswer(A20S14_05_Label); break
        case 6: setSelectedAnswer(A20S14_06_Label); break
        case 7: setSelectedAnswer(A20S14_07_Label); break
        case 8: setSelectedAnswer(A20S14_08_Label); break
        case 9: setSelectedAnswer(A20S14_09_Label); break
        default:  break
        }
        switch (Q21S15){
        case 1: setSelectedAnswer(A21S15_01_Label); break
        case 2: setSelectedAnswer(A21S15_02_Label); break
        case 3: setSelectedAnswer(A21S15_03_Label); break
        case 4: setSelectedAnswer(A21S15_04_Label); break
        default:  break
        }
        switch (Q22S16){
        case 1: setSelectedAnswer(A22S16_01_Label); break
        case 2: setSelectedAnswer(A22S16_02_Label); break
        default:  break
        }
        switch (Q23S17){
        case 1: setSelectedAnswer(A23S17_01_Label); break
        case 2: setSelectedAnswer(A23S17_02_Label); break
        default:  break
        }
        
        self.navigationItem.title = "SCIM HISTORY"        
        
//        dispatch_async(dispatch_get_main_queue(), {
//            
//            var layout = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: .Top, relatedBy: .Equal, toItem: self.myScrollView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
//            self.view.addConstraint(layout)
//        
//        })

        
        print(" userIDInput in one history: \(userIDInput)\nDateAndTime is \(SCIMdateAndTime)")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.myScrollView.frame = self.view.bounds
        self.myScrollView.contentSize.height = 5100
        self.myScrollView.contentSize.width = 0
        
    }
    
    func setSelectedAnswer(_ label: UILabel) {
//        label.layer.borderColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1).CGColor as CGColorRef
//        label.layer.backgroundColor = UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:0.5).CGColor as CGColorRef
       // label.layer.borderWidth = 2
        label.layer.cornerRadius = 0.1 * A01S1_01_Label.bounds.size.width
        label.font = UIFont(name: "Trebuchet MS", size: 14)
        
        label.textColor = UIColor (red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1)
    }
}
