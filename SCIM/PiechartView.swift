//
//  PieChart.swift
//  SCIM
//
//  Created by yannian liu on 16/2/25.
//  Copyright © 2016年 yannian liu. All rights reserved.
//

import UIKit


public protocol PiechartViewDelegate {
    func setPercent(_ total: CGFloat, slice: PiechartView.Slice) -> String
    func setCountVsTotal(_ total: CGFloat, slice: PiechartView.Slice) -> String
}



// *** Piechart *** //
open class PiechartView: UIControl {
    var touchPosition = CGPoint()
    /**
     * Slice
     */
    public struct Slice {
        public var color: UIColor!
        public var value: CGFloat!
    }
    
    /**
     * Radius
     */
    public struct Radius {
        public var inner: CGFloat = 30
        public var outer: CGFloat = 55
        public var outerActive: CGFloat = 63
    }
    
    /**
     * private
     */

    fileprivate var percent_Label: UILabel!
    fileprivate var countVsTotal_Label: UILabel!
    fileprivate var total: CGFloat!
    
    
    /**
     * public
     */
    open var radius: Radius = Radius()
    open var activeSlice: Int = 0
    open var delegate: PiechartViewDelegate?
    

    
    open var percent_String: String = "percent" {
        didSet {
            percent_Label.text = percent_String
        }
    }
    
    open var countVsTotal: String = "countVsTotal" {
        didSet {
            countVsTotal_Label.text = countVsTotal
        }
    }
    
    open var slice_Array: [Slice] = [] {
        didSet {
            total = 0
            for slice in slice_Array {
                total = slice.value + total
            }
        }
    }
    
    
    
    /**
     * methods
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor.white.cgColor as CGColor
        

        self.addTarget(self, action: #selector(PiechartView.click), for: .touchUpInside)
        

        
        percent_Label = UILabel()
        percent_Label.text = percent_String
        percent_Label.font = UIFont(name: "TrebuchetMS-Bold", size: 22.0)
        //subtitle_Label.textColor = UIColor.grayColor()
        percent_Label.textAlignment = .center
        percent_Label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(percent_Label)
        
        countVsTotal_Label = UILabel()
        countVsTotal_Label.text = percent_String
        countVsTotal_Label.font = UIFont(name: "TrebuchetMS-Bold", size: 16.0)
        countVsTotal_Label.textColor = UIColor.gray
        countVsTotal_Label.textAlignment = .center
        countVsTotal_Label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(countVsTotal_Label)
        
        self.addConstraint(NSLayoutConstraint(item: percent_Label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: percent_Label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 5))

        self.addConstraint(NSLayoutConstraint(item: countVsTotal_Label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: countVsTotal_Label, attribute: .top, relatedBy: .equal, toItem: percent_Label, attribute: .bottom, multiplier: 1, constant: 0))
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        var startValue: CGFloat = 0
        var startAngle: CGFloat = 0
        var endValue: CGFloat = 0
        var endAngle: CGFloat = 0
        
        for (index, slice) in slice_Array.enumerated() {
            
            startAngle = (startValue * 2 * CGFloat(M_PI)) - CGFloat(M_PI_2)
            endValue = startValue + (slice.value / self.total)
            endAngle = (endValue * 2 * CGFloat(M_PI)) - CGFloat(M_PI_2)
            //print(startAngle)
            
            let path = UIBezierPath()
            path.move(to: center)
            
            
            let color = slice.color
            if (index == activeSlice) {
                
                percent_String = delegate?.setPercent(self.total, slice: slice) ?? "percent"
                countVsTotal = delegate?.setCountVsTotal(self.total, slice: slice) ?? "countVsTotal"
                path.addArc(withCenter: center, radius: radius.outerActive, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            } else {
                path.addArc(withCenter: center, radius: radius.outer, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            }
            color?.setFill()
            path.fill()
            
            // add white border to slice
            UIColor.clear.setStroke()
            path.stroke()
            
            // increase start value for next slice
            startValue += slice.value / self.total
        }
        
        // create center donut hole
        let innerPath = UIBezierPath()
        innerPath.move(to: center)
        innerPath.addArc(withCenter: center, radius: radius.inner, startAngle: 0, endAngle: CGFloat(M_PI) * 2, clockwise: true)
        UIColor.white.setFill()
        innerPath.fill()
    }
    
    func click() {

        activeSlice += 1
        if activeSlice >= slice_Array.count {
            activeSlice = 0
        }
        setNeedsDisplay()
    }
    
    
}
