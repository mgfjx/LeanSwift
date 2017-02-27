//
//  CustomTableViewCell.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/13.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate {
    func onClickImage(image:UIImage);
}

class CustomTableViewCell: UITableViewCell {
    
    //共有变量
    var delegate:CustomTableViewCellDelegate?;
    var title:String{
        set{
            self.label?.text = newValue;
        }
        get{
            return self.title;
        }
    };
    var imageName:String{
        set{
            self.imgView?.image = UIImage(named: newValue);
        }
        get{
            return self.imageName;
        }
    };
    
    
    //私有变量
    private var label:UILabel?;
    private var bgV: UIView?;
    private var imgView:UIImageView?;

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.contentView.backgroundColor = UIColor.lightGray;
        self.selectionStyle = .none;
        
        let bgView:UIView = UIView();
        bgView.layer.cornerRadius = 10.0;
        bgView.layer.masksToBounds = true;
        bgView.layer.borderColor = UIColor.white.cgColor;
        bgView.layer.borderWidth = 1;
        self.contentView.addSubview(bgView);
        bgV = bgView;
        
        let titleLabel:UILabel = UILabel();
        titleLabel.textAlignment = .center;
        titleLabel.backgroundColor = UIColor.white;
        bgView.addSubview(titleLabel);
        label = titleLabel;
        
        let imageView:UIImageView = UIImageView();
        imageView.isUserInteractionEnabled = true;
        bgView.addSubview(imageView);
        imgView = imageView;
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler));
        imageView.addGestureRecognizer(tap);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapHandler(tap:UITapGestureRecognizer){
        if (self.delegate != nil) {
            self.delegate?.onClickImage(image: (imgView?.image)!);
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        let width:CGFloat = self.frame.size.width;
        let height:CGFloat = self.frame.size.height;
        let offset:CGFloat = 10.0;
        
        bgV?.frame = CGRect(x: offset, y: offset, width: width - 2*offset, height: height - offset*2);
        bgV?.backgroundColor = UIColor.purple;
        
        label?.frame = CGRect(x: 0, y: 0, width: (bgV?.frame.size.width)!, height: 30);
        
        let maxY:CGFloat   = (label?.frame)!.maxY;
        imgView?.frame = CGRect(x: 0, y: maxY, width: (bgV?.frame.size.width)!, height: (bgV?.frame.size.height)! - (label?.frame.size.height)!);
        imgView?.backgroundColor = UIColor.purple;
        
    }

}













