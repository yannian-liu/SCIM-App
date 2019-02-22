//
//  OneDiagramViewController.swift
//  SCIM
//
//  Created by yannian liu on 16/2/25.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit

class OneDiagramViewController: UIViewController, PiechartViewDelegate {
    var QuestionName_String = String()
    var QuestionContent_String = String()
    var AnswerQuantity_Int = Int();
    var Answer_Array = [String()]
    var QuestionType_String = String()
    
    var AnswerSlice_Array :[PiechartView.Slice] = []
    var AnswerCount_Array :[Int] = [4,6,10,3,2,3,4,0,0,0,0,0]
    var AnswerColor_Array = [UIColor(red:246.0/255.0, green:157.0/255.0, blue:218.0/255.0, alpha:1),UIColor(red:60.0/255.0, green:175.0/255.0, blue:240.0/255.0, alpha:1),UIColor(red:251.0/255.0, green:223.0/255.0, blue:153.0/255.0, alpha:1),UIColor(red:59.0/255.0, green:172.0/255.0, blue:127.0/255.0, alpha:1),UIColor(red:145.0/255.0, green:92.0/255.0, blue:177.0/255.0, alpha:1),UIColor(red:155.0/255.0, green:155.0/255.0, blue:155.0/255.0, alpha:1),UIColor(red:164.0/255.0, green:47.0/255.0, blue:47.0/255.0, alpha:1),UIColor(red:44.0/255.0, green:208.0/255.0, blue:208.0/255.0, alpha:1),UIColor(red:187.0/255.0, green:136.0/255.0, blue:27.0/255.0, alpha:1),UIColor(red:37.0/255.0, green:87.0/255.0, blue:167.0/255.0, alpha:1),UIColor(red:255.0/255.0, green:153.0/255.0, blue:0.0/255.0, alpha:1)]
    
    
    @IBOutlet weak var QuestionContent_Label: UILabel!
    
    @IBOutlet weak var PieChart_View: UIView!

    
    @IBOutlet weak var A1_Label: UILabel!
    @IBOutlet weak var A2_Label: UILabel!
    @IBOutlet weak var A3_Label: UILabel!
    @IBOutlet weak var A4_Label: UILabel!
    @IBOutlet weak var A5_Label: UILabel!
    @IBOutlet weak var A6_Label: UILabel!
    @IBOutlet weak var A7_Label: UILabel!
    @IBOutlet weak var A8_Label: UILabel!
    @IBOutlet weak var A9_Label: UILabel!
    @IBOutlet weak var A10_Label: UILabel!
    @IBOutlet weak var A11_Label: UILabel!
    
    @IBOutlet weak var ShowColour1_Button: UIButton!
    @IBOutlet weak var ShowColour2_Button: UIButton!
    @IBOutlet weak var ShowColour3_Button: UIButton!
    @IBOutlet weak var ShowColour4_Button: UIButton!
    @IBOutlet weak var ShowColour5_Button: UIButton!
    @IBOutlet weak var ShowColour6_Button: UIButton!
    @IBOutlet weak var ShowColour7_Button: UIButton!
    @IBOutlet weak var ShowColour8_Button: UIButton!
    @IBOutlet weak var ShowColour9_Button: UIButton!
    @IBOutlet weak var ShowColour10_Button: UIButton!
    @IBOutlet weak var ShowColour11_Button: UIButton!
    
    
    var AnswerLabel_Array = [UILabel()]
    var ShowColourButton_Array = [UIButton()]
    
    
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    var Time = 5;
    var Timer = Foundation.Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(" ~~ one diagram page ~~ ")
        print("QuestionName_String:\(QuestionName_String)\nQuestionContent_String:\(QuestionContent_String)AnswerQuantity_Int:\(AnswerQuantity_Int)\nAnswer_Array:\(Answer_Array)\nQuestionType_String:\(QuestionType_String)")
        
        
        
        
        

        
        AnswerLabel_Array = [A1_Label,A2_Label,A3_Label,A4_Label,A5_Label,A6_Label,A7_Label,A8_Label,A9_Label,A10_Label,A11_Label,]
        for index in 0 ..< 11 {
            AnswerLabel_Array[index].isHidden = true
        }
        
        ShowColourButton_Array = [ShowColour1_Button,ShowColour2_Button,ShowColour3_Button,ShowColour4_Button,ShowColour5_Button,ShowColour6_Button,ShowColour7_Button,ShowColour8_Button,ShowColour9_Button,ShowColour10_Button,ShowColour11_Button]
        for index in 0 ..< 11 {
            ShowColourButton_Array[index].isHidden = true
        }
        
        QuestionContent_Label.text = QuestionContent_String
        ShowColour1_Button.frame.size = CGSize (width: 20,height: 20)
        
        
        
        self.getCountArray("http://Localhost:8080/SCIM/GetPieChartDate", QuestionType_p: self.QuestionType_String, QuestionName_p: self.QuestionName_String)
        
        DispatchQueue.main.async(execute: {
        var views: [String: UIView] = [:]
        
        for index in 0 ..< self.AnswerQuantity_Int {
            self.AnswerLabel_Array[index].text = self.Answer_Array[index]
            self.AnswerLabel_Array[index].isHidden = false
            self.ShowColourButton_Array[index].backgroundColor = self.AnswerColor_Array[index]
            self.ShowColourButton_Array[index].isHidden = false
            
            var temp = PiechartView.Slice()
            temp.value = CGFloat(self.AnswerCount_Array[index])
            temp.color = self.AnswerColor_Array[index]
//            temp.text = "A\(index)"
            self.AnswerSlice_Array.append(temp)
            
        }
        
        print("sssss")
            
        let piechart = PiechartView()
        piechart.delegate = self
        //piechart.title = "Service"
        piechart.activeSlice = 2
        piechart.layer.borderWidth = 1
        piechart.slice_Array = self.AnswerSlice_Array
        //piechart.slices = [error, zero, win]
        
        piechart.translatesAutoresizingMaskIntoConstraints = false
        self.PieChart_View.addSubview(piechart)
        views["piechart"] = piechart
        self.PieChart_View.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[piechart]-|", options: [], metrics: nil, views: views))
        self.PieChart_View.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[piechart]-|", options: [], metrics: nil, views: views))
        //PieChart_View.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[piechart(==200)]", options: [], metrics: nil, views: views))

        })
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPercent(_ total: CGFloat, slice: PiechartView.Slice) -> String {
        return "\(Int(slice.value / total * 100))% "
    }
    
    func setCountVsTotal(_ total: CGFloat, slice: PiechartView.Slice) -> String {
        return "\(Int(slice.value))/\(Int(total))"
    }
    

    func getCountArray(_ urlString: String, QuestionType_p: String, QuestionName_p: String){
        self.myActivityIndicatorView.isHidden = false
        self.myActivityIndicatorView.startAnimating()
        self.Time = 5
        self.Timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(OneDiagramViewController.TimeOut), userInfo: nil, repeats: true)
        

        
        print ("** Start making pei chart **")
        let url = URL(string: urlString)
        
        
        let request = NSMutableURLRequest(url:url!);
        request.httpMethod = "POST";
        let postString = "questionType=\(QuestionType_p)&&questionName=\(QuestionName_p)";
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
                    self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
                }
                
                return
            }
            
            //print(" response = \(response)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print(" responseString = \(responseString)")
            
            
            do {
                let myJSON = try JSONSerialization.jsonObject(with: data!, options:.mutableLeaves) as? NSDictionary
                //print (myJSON)
                // *** This id is not exist ***
                if myJSON == [:]{
                    OperationQueue.main.addOperation {
                        self.Timer.invalidate()
                        self.myActivityIndicatorView.isHidden = true
                        self.showCancelAlert("Network Error", message_p: "Please check the network or try later.",actionTitle_p: "Cancel")
                    }
                    
                } else {
                    let parseJSON = myJSON
                    
                    for index in 0...10 {
                    //for var index = 0; index < 11; index++ {
                        self.AnswerCount_Array[index] = (parseJSON!["\(index)"] as? Int)!;
                        print("AnswerCount_Array[\(index)] is \(self.AnswerCount_Array[index])");
                    }
                }
                
                DispatchQueue.main.async(execute: {
                    self.Timer.invalidate()
                    self.myActivityIndicatorView.isHidden = true
                    self.view.setNeedsDisplay()
                })
                
            } catch let error as NSError {
                
                //print(error.localizedDescription)
                
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
