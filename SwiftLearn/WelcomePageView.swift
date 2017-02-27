//
//  WelcomePageView.swift
//  WelcomePages
//
//  Created by mgfjx on 2017/2/27.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

class WelcomePageView: UIViewController, UIScrollViewDelegate {
    
    private var imgScrollView:UIScrollView?;
    private var pageControl:UIPageControl?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let frame:CGRect = self.view.bounds;
        
        let scrollView:UIScrollView = UIScrollView.init(frame: frame);
        scrollView.isPagingEnabled = true;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.bounces = false;
        scrollView.delegate = self;
        self.view.addSubview(scrollView);
        imgScrollView = scrollView;
        
        let page:UIPageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40));
        page.center = CGPoint.init(x: frame.size.width/2, y: frame.size.height - 60);
        page.numberOfPages = 4;
        self.view.addSubview(page);
        pageControl = page;
        
        self.addImages();
    }
    
    func addImages() -> Void {
        imgScrollView?.contentSize = CGSize.init(width: self.view.frame.size.width * 4, height: self.view.frame.size.height);
        for index in 0 ..< 4 {
            let imageView:UIImageView = UIImageView.init(frame: CGRect.init(x: self.view.frame.size.width*CGFloat(index), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height));
            if index == 3 {
                imageView.isUserInteractionEnabled = true;
                let tap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapHandler(tap:)));
                imageView.addGestureRecognizer(tap);
            }
            imageView.backgroundColor = UIColor.randomColor();
            imageView.image = UIImage.init(named: "paper\(index).jpg");
            imgScrollView?.addSubview(imageView);
            
        }
    }
    
    func tapHandler(tap:UITapGestureRecognizer) -> Void {
//        self.present(ViewController(), animated: false, completion: nil);
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0.01;
            }) { (true) in
                self.present(ViewController(), animated: false, completion: nil);
        };
    }
    
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index:Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width);
        pageControl?.currentPage = index;
    }

}
