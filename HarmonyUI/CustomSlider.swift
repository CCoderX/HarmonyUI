//
//  CustomSlider.swift
//  HarmonyUI
//
//  Created by user on 8/29/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    var maxValue = 100.0 , minValue = 0.0
    var valueLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        valueLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: frame.width / 5, height: frame.height / 1.5)))
        
        valueLabel!.frame.origin.y -= valueLabel!.frame.height
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        valueLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: frame.width / 6, height: frame.height)))
        valueLabel?.backgroundColor = .gray
        valueLabel!.frame.origin.y -= valueLabel!.frame.height*1.5
        setThumbDefault(text: String((maxValue - minValue)/2))
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        valueLabel?.backgroundColor = .lightGray
        valueLabel?.textAlignment = .left
        valueLabel!.frame.origin.x = touch.location(in: touch.view).x - valueLabel!.frame.width/2
        self.addSubview(valueLabel!)
        setThumbDefault(text: "III")
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        valueLabel?.frame.origin.x = CGFloat(value)*(frame.width-valueLabel!.frame.width)
        
        valueLabel?.text = String(Int(Float(maxValue-minValue)*value))
        valueLabel?.textAlignment = .left
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        valueLabel!.removeFromSuperview()
        setThumbDefault(text: String(Int(Double(value)*(maxValue-minValue))))
    }
    private func setThumbDefault(text : String) {
        valueLabel?.text = text
        valueLabel?.backgroundColor = .lightGray
        valueLabel?.textAlignment = .center
        setThumbImage(UIImage.imageWithLabel(label: valueLabel!), for: .normal)
    }

}
extension UIImage {
    class func imageWithLabel(label: UILabel) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
