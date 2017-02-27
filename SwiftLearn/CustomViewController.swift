//
//  CustomViewController.swift
//  SwiftLearn
//
//  Created by mgfjx on 2017/2/13.
//  Copyright © 2017年 XXL. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomTableViewCellDelegate {
    
    var myTableView : UITableView?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray;
        self.title = "CustomVC";
        
        let table:UITableView = UITableView(frame: self.view.bounds, style: .plain);
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = .none;
        self.view.addSubview(table);
        myTableView = table;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "cell";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! CustomTableViewCell?;
        if cell == nil {
            cell = CustomTableViewCell(style: .default, reuseIdentifier: identifier);
        }
        
        cell?.title = "hehe";
        cell?.imageName = "5.jpg";
        cell?.delegate = self;
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false);
        myTableView?.reloadData();
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300;
    }
    
    func onClickImage(image: UIImage) {
        let view:ImageScanView = ImageScanView(frame: CGRect.zero, image: image);
        view.show();
    }

}
