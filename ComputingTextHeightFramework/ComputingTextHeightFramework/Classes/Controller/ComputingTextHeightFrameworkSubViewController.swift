//
//  ComputingTextHeightFrameworkSubViewController.swift
//  ComputingTextHeightFramework
//
//  Created by JOE on 2018/4/13.
//  Copyright © 2018年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

class ComputingTextHeightFrameworkSubViewController: ComputingTextHeightFrameworkBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ComputingTextHeightFrameworkSubViewController {
    
    //MARK: UI
    
    fileprivate func setPage() {
        
        self.title = "Sub"
        let rightBarButton = UIBarButtonItem(title: "进入Home", style: .plain, target: self, action: #selector(rightBarButtonAction))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc fileprivate func rightBarButtonAction() {
        
        self.navigationController?.pushViewController(ComputingTextHeightFrameworkHomeViewController(), animated: true)
    }
}











