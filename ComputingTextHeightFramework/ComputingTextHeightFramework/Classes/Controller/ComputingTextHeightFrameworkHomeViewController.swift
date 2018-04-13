//
//  ComputingTextHeightFrameworkHomeViewController.swift
//  ComputingTextHeightFramework
//
//  Created by JOE on 2018/4/13.
//  Copyright © 2018年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

class ComputingTextHeightFrameworkHomeViewController: ComputingTextHeightFrameworkBaseViewController {

    ///testLabel
    var testLabel:UILabel!
    
    ///单行Label
    var singleLineLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ComputingTextHeightFrameworkHomeViewController {
    
    //MARK: UI
    
    fileprivate func setPage() {
        
        self.title = "Home"
        self.addTestLabel()
        self.addSingleLineLabel()
    }
    
    fileprivate func addTestLabel() {
        
        self.testLabel = UILabel(frame: CGRect(x: 20, y: 100, width: screenWidth - 20*2, height: 100))
        testLabel.backgroundColor = UIColor.lightGray
        testLabel.text = TextForLabel
        testLabel.numberOfLines = 0
        testLabel.font = UIFont.systemFont(ofSize: 14)
        testLabel.textAlignment = .left
        
        testLabel.setText(text: TextForLabel, lineSpaing: 8, labelWidth: screenWidth - 20*2, font: UIFont.systemFont(ofSize: 14)) //设置行间距
        let labelHeight = TextForLabel.heightWithLabelFont(font: UIFont.systemFont(ofSize: 14), labelWidth: screenWidth - 20*2, lineSpacing: 8, label: testLabel)
        testLabel.frame = CGRect(x: 20, y: 100, width: screenWidth - 20*2, height: labelHeight)
        self.view.addSubview(testLabel)
    }
    
    fileprivate func addSingleLineLabel() {
        
        self.singleLineLabel = UILabel(frame: CGRect(x: 20, y: self.testLabel.frame.maxY + 20, width: screenWidth - 20*2, height: 100))
        singleLineLabel.backgroundColor = UIColor.lightGray
        singleLineLabel.text = "这是单行文本。"
        singleLineLabel.numberOfLines = 0
        singleLineLabel.font = UIFont.systemFont(ofSize: 14)
        singleLineLabel.textAlignment = .left
        
        let labelHeight = singleLineLabel.text!.heightWithLabelFont(font: UIFont.systemFont(ofSize: 14))
        singleLineLabel.frame = CGRect(x: 20, y: self.testLabel.frame.maxY + 20, width: screenWidth - 20*2, height: labelHeight)
        self.view.addSubview(singleLineLabel)
    }
}







