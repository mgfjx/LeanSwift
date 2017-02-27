//
//  ColorExtension.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/15.
//  Copyright © 2017年 XXL. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    public var colorString:String {
        get{
            return self.getColorString()
        }
    }
    
    class func colorWithHexNum(hexNumber: UInt32) -> UIColor{
        return UIColor.colorWithHexNum(hexNumber: hexNumber, alpha: 1.0);
    }
    
    class func colorWithHexString(hexString: String) -> UIColor {
        return UIColor.colorWithHexString(hexString: hexString, alpha: 1.0);
    }
    
    /**
     根据颜色值获取UIColor对象
     
     - parameter hexString:	颜色值字符串, eg: 0x69a804, 69a804
     - parameter alpha:			透明度
     
     - returns: UIColor实例
     */
    class func colorWithHexNum(hexNumber: UInt32, alpha: CGFloat) -> UIColor {
        
        if hexNumber > 0xFFFFFF {
            return UIColor.clear;
        }
        
        let red   = (CGFloat)((hexNumber >> 16) & 0xFF) / 255.0;
        let green = (CGFloat)((hexNumber >> 8) & 0xFF) / 255.0;
        let blue  = (CGFloat)(hexNumber & 0xFF) / 255.0;
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha);
        return color;
    }
    
    /**
     根据颜色值获取UIColor对象
     
     - parameter hexString:	颜色值字符串, eg: "0x69a804", "#69a804", "69a804"
     - parameter alpha:			透明度
     
     - returns: UIColor实例
     */
    class func colorWithHexString(hexString: String, alpha: CGFloat) -> UIColor {
        
        var string: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased();
        let defaultColor = UIColor.clear;
        if (string.characters.count < 6) {
            return defaultColor;
        }
        if string.hasPrefix("#") {
            let index = string.index(string.startIndex, offsetBy: 1);
            string = string.substring(from: index);
        }
        if string.hasPrefix("0X") {
            let index = string.index(string.startIndex, offsetBy: 2);
            string = string.substring(from: index);
        }
        if string.characters.count != 6 {
            return defaultColor;
        }
        
        let scanner:Scanner = Scanner.init(string: string);
        var hexNum:UInt32 = 0;
        if !scanner.scanHexInt32(&hexNum) {
            return defaultColor;
        }
        
        return UIColor.colorWithHexNum(hexNumber: hexNum, alpha: alpha);
    }
    
    /* 随机颜色 */
    class func randomColor() -> UIColor {
        return UIColor.randomColorWithAlpha(alpha: 1.0);
    }
    
    /* 随机颜色: alpha为透明度 */
    class func randomColorWithAlpha(alpha: CGFloat) -> UIColor {
        let red:CGFloat = (CGFloat)(arc4random()%255)/255.0;
        let green:CGFloat = (CGFloat)(arc4random()%255)/255.0;
        let blue:CGFloat = (CGFloat)(arc4random()%255)/255.0;
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha);
    }
    
    
    func getColorString() -> String {
        
        let cgColor:CGColor = self.cgColor;
        
        var red = 0, green = 0, blue = 0;
        let size:Int = cgColor.numberOfComponents;
        if size == 4 {
            let components = cgColor.__unsafeComponents;
            red = Int(floorf(Float(components![0]*255.0)));
            green = Int(floorf(Float(components![1]*255.0)));
            blue = Int(floorf(Float(components![2]*255.0)));
        }
        
        if size == 2 {
            let components = cgColor.__unsafeComponents;
            red = Int(floorf(Float(components![0]*255.0)));
            green = Int(floorf(Float(components![0]*255.0)));
            blue = Int(floorf(Float(components![0]*255.0)));
        }
        
        let hexNumber = 0x000000 | (red << 16) | (green << 8) | blue;
        
        let hexString:String = String.init(format: "0x%06x", hexNumber);
        
        return hexString;
    }
    
}
