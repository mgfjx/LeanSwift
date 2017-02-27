//
//  ImageScanView.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/13.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

class ImageScanView: UIView {
    
    private var imageView:UIImageView?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }

    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame);
        
        self.frame = UIScreen.main.bounds;
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5);
        
        let imgView : UIImageView = UIImageView.init();
        let width:CGFloat = UIScreen.main.bounds.size.width;
        let height:CGFloat = UIScreen.main.bounds.size.height;
        let offset:CGFloat = 20.0;
        imgView.frame = CGRect(x: 0, y: 0, width: width - 2*offset, height: width - 2*offset);
        imgView.center = CGPoint(x: width/2, y: height/2);
        imgView.image = image;
        imgView.isUserInteractionEnabled = true;
        self.addSubview(imgView);
        imageView = imgView;
        
        self.isUserInteractionEnabled = true;
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapH));
        self.addGestureRecognizer(tap);
        
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1);
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(self);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapH(tap:UITapGestureRecognizer){
        UIView.animate(withDuration: 0.25, animations: {
            self.imageView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1);
            }) { (false) in
                self.removeFromSuperview();
        };
    }
    
    func show(){
        UIView.animate(withDuration: 0.25, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
        }) { (false) in
            
        };
    }

}
