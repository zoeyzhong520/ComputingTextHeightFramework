//
//  ComputingTextHeightFrameworkBaseViewController.swift
//  ComputingTextHeightFramework
//
//  Created by JOE on 2018/4/13.
//  Copyright © 2018年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

class ComputingTextHeightFrameworkBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ComputingTextHeightFrameworkBaseViewController {
    
    //MARK: UI
    
    fileprivate func setPage() {
        
        self.view.backgroundColor = UIColor.white
    }
}
