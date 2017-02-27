//
//  AutoScrollLable.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/20.
//  Copyright © 2017年 XXL. All rights reserved.
//

import Foundation
import UIKit

class AutoScrollLabel: UIView {
    
    var canScroll:Bool = false;
    var text:String?;
    var font:UIFont?;
    var textAlignment:NSTextAlignment?;
    var textColor:UIColor?;
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.marqueeInView();
    }
    
    func marqueeInView() -> Void {
        
        var size:CGSize = CGSize();
        
        if !((self.text?.isEmpty)!) {
            size = (self.text! as NSString).boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: self.bounds.size.height), options: NSStringDrawingOptions.usesFontLeading, attributes: [NSFontAttributeName:self.font!], context: nil).size;
        }
        
        let scrollLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height));
        scrollLabel.font = self.font;
        scrollLabel.text = self.text;
        scrollLabel.backgroundColor = UIColor.clear;
        scrollLabel.center = CGPoint(x: scrollLabel.center.x, y: self.bounds.size.height/2);
        self.addSubview(scrollLabel);
        self.clipsToBounds = true;
        self.text = "";
        
        if size.width <= self.bounds.size.width {
            self.canScroll = false;
        }
        
        if self.canScroll {
            let moveAnimation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x");
            let duration:Double = Double(size.width/100.0);
            moveAnimation.duration = duration;
            moveAnimation.keyTimes = [0.0, 0.1, 1.0];
            moveAnimation.values = [0, 0, (-size.width + self.frame.size.width)];
            moveAnimation.repeatCount = MAXFLOAT;
            moveAnimation.timingFunction = CAMediaTimingFunction(name: "linear");
            scrollLabel.layer.add(moveAnimation, forKey: "move");
        }
    }
    
}
