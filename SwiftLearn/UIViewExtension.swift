//
//  UIViewExtension.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/20.
//  Copyright © 2017年 XXL. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /* 截屏操作 */
    func snapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0);
        self.layer.render(in: UIGraphicsGetCurrentContext()!);
        let snap:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return snap;
    }
    
    /* 设置阴影 */
    func shadow(shadowColor: UIColor, offset: CGSize, radius: CGFloat) {
        self.layer.shadowColor = shadowColor.cgColor;
        self.layer.shadowOffset = offset;
        self.layer.shadowRadius = radius;
        self.layer.shadowOpacity = 1;
        self.layer.shouldRasterize = true;
        self.layer.rasterizationScale = UIScreen.main.scale;
    }
    
    /* 移除子views */
    func removeAllSubViews() {
        while self.subviews.count != 0 {
            self.subviews.last?.removeFromSuperview();
        }
    }
    
    //origin:x
    var x:CGFloat{
        set{
            var frame:CGRect = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
        get{
            return self.frame.origin.x;
        }
    }
    
    //origin:y
    var y:CGFloat{
        set{
            var frame:CGRect = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
        get{
            return self.frame.origin.y;
        }
    }
    
    //size:width
    var width:CGFloat{
        set{
            var frame:CGRect = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
        get{
            return self.frame.size.width;
        }
    }
    
    //size:height
    var height:CGFloat{
        set{
            var frame:CGRect = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
        get{
            return self.frame.size.height;
        }
    }
    
    //origin
    var origin:CGPoint {
        set{
            var frame:CGRect = self.frame;
            frame.origin = newValue;
            self.frame = frame;
        }
        get{
            return self.frame.origin;
        }
    }
    
    //size
    var size:CGSize {
        set{
            var frame:CGRect = self.frame;
            frame.size = newValue;
            self.frame = frame;
        }
        get{
            return self.frame.size;
        }
    }
    
    
    
}
