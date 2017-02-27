//
//  ViewController.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/13.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit
import GLKit

class ViewController: UIViewController {
    
    var myLayer:CAShapeLayer?;
    override var prefersStatusBarHidden: Bool {
        get{
            return false;
        }
    }
    
    var window:UIWindow?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        
        let layer:CAShapeLayer = CAShapeLayer.init();
        layer.fillColor = UIColor.clear.cgColor;
        layer.strokeColor = UIColor.randomColor().cgColor;
        layer.lineCap = kCALineCapRound;
        layer.lineJoin = kCALineJoinRound;
        layer.lineWidth = 4;
        layer.frame = self.view.bounds;
        layer.path = self.arcPath().cgPath;
        self.view.layer.addSublayer(layer);
        self.myLayer = layer;
        
        let slider:UISlider = UISlider.init(frame: CGRect.init(x: 20, y: self.view.height - 40, width: self.view.width - 80, height: 40));
        slider.addTarget(self, action: #selector(sliderValueChange(slider:)), for: .valueChanged);
        slider.maximumValue = 1.0;
        slider.minimumValue = 0.0;
        self.view.addSubview(slider);
        
        
        let btn:UIButton = UIButton(type: .custom);
        btn.frame = CGRect(x: slider.frame.maxX + 5, y: slider.frame.minY + 5, width: self.view.width - slider.frame.maxX - 10, height: slider.height - 10);
        btn.setTitle("Run", for: .normal);
        btn.addTarget(self, action: #selector(startAnimation(heh:)), for: .touchUpInside);
        let color = UIColor.colorWithHexNum(hexNumber: 0xabdad);
        print(color.colorString);
        btn.shadow(shadowColor: UIColor.black, offset: CGSize.init(width: 3, height: 3), radius: 5);
        btn.backgroundColor = color;
        self.view.addSubview(btn);
        
    }
    
    func sliderValueChange(slider:UISlider) -> Void {
        myLayer?.strokeStart = CGFloat(slider.value);
    }
    
    func startAnimation(heh:UIButton) -> Void {
//        myLayer?.add(self.pathBasicAnimate(), forKey: "animate");
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    func pathBasicAnimate() -> CABasicAnimation {
        let animate:CABasicAnimation = CABasicAnimation(keyPath: "path");
        animate.isRemovedOnCompletion = false;
        animate.duration = 2;
        animate.fillMode = kCAFillModeBoth;
        animate.toValue = self.DIYPath().cgPath;
        return animate;
    }
    
    func DIYPath() -> UIBezierPath {
        let path:UIBezierPath = UIBezierPath.init();
        path.move(to: CGPoint.init(x: 100, y: 300));
        path.addLine(to: CGPoint.init(x: 100, y: 400));
        path.addLine(to: CGPoint.init(x: 80, y: 370));
        path.move(to: CGPoint.init(x: 100, y: 400));
        path.addLine(to: CGPoint.init(x: 120, y: 370));
        return path;
    }
    
    func classTwoBezierPath() -> UIBezierPath {
        let path:UIBezierPath = UIBezierPath();
        path.move(to: CGPoint.init(x: 100, y: 300));
        path.addCurve(to: CGPoint.init(x: 300, y: 300), controlPoint1: CGPoint.init(x: 200, y: 200), controlPoint2: CGPoint.init(x: 200, y: 400))
        return path;
    }
    
    func classOneBezierPath() -> UIBezierPath {
        let path:UIBezierPath = UIBezierPath();
        path.move(to: CGPoint.init(x: 100, y: 300));
        path.addQuadCurve(to: CGPoint.init(x: 300, y: 300), controlPoint: CGPoint.init(x: 200, y: 400));
        return path;
    }
    
    func circlePath() -> UIBezierPath {
        return UIBezierPath.init(ovalIn: CGRect(x: 0, y: 300, width: 100, height: 100));
    }
    
    func rectanglePath() -> UIBezierPath {
        return UIBezierPath.init(rect: CGRect(x: 0, y: 300, width: 100, height: 100));
    }
    
    func roundedPath() -> UIBezierPath {
        return UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 300, width: 100, height: 100), cornerRadius: 5);
    }
    
    func arcPath() -> UIBezierPath {
        return UIBezierPath.init(arcCenter: CGPoint.init(x: 100, y: 300), radius: 50, startAngle: CGFloat(0), endAngle: CGFloat(2*M_PI), clockwise: true);
    }
    
    func paomadeng() -> Void {
        let label:AutoScrollLabel = AutoScrollLabel(frame: CGRect(x: 100, y: 300, width: 100, height: 40));
        label.text = "一阵轻柔婉转的歌声，飘在烟水蒙蒙的湖面上。歌声发自一艘小船之中，船里五个少女和歌嘻笑，荡舟采莲。她们唱的曲子是北宋大词人欧阳修所作的“蝶恋花”词，写的正是越女采莲的情景";
        label.font = UIFont.systemFont(ofSize: 18);
        label.textAlignment = NSTextAlignment.center;
        label.canScroll = true;
        label.backgroundColor = UIColor.colorWithHexNum(hexNumber: 0xf9f9f9);
        self.view.addSubview(label);
        self.setNeedsStatusBarAppearanceUpdate();
    }
    
    func jumpToVC(sender:UIButton) -> Void {
        let vc:CustomViewController = CustomViewController();
        self.navigationController?.pushViewController(vc, animated: true);
    }

}

