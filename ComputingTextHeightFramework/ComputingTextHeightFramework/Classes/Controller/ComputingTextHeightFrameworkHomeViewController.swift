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
    
    ///UIScrollView
    var scrollView:UIScrollView!
    
    ///TestLabelH
    var TestLabelH:CGFloat = 0.0
    
    ///SingleLineLabelH
    var SingleLineLabelH:CGFloat = 0.0
    
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
        self.automaticallyAdjustsScrollViewInsets = false
        self.addScrollView()
        self.addTestLabel()
        self.addSingleLineLabel()
        self.setContentSizeOfScrollView()
    }
    
    fileprivate func addScrollView() {
        
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: NavigationBarHeight + StatusBarHeight, width: screenWidth, height: screenHeight - (NavigationBarHeight + StatusBarHeight)))
        scrollView.backgroundColor = UIColor.cyan
        self.view.addSubview(scrollView)
    }
    
    ///contentSize of scrollView
    fileprivate func setContentSizeOfScrollView() {
    
        self.scrollView.contentSize = CGSize(width: screenWidth, height: self.TestLabelH + self.SingleLineLabelH + 20*3)
    }
    
    fileprivate func addTestLabel() {
        
        self.testLabel = UILabel()
        testLabel.backgroundColor = UIColor.lightGray
        testLabel.text = TextForLabel
        testLabel.numberOfLines = 0
        testLabel.font = UIFont.systemFont(ofSize: 14)
        testLabel.textAlignment = .left
        
        testLabel.setText(text: TextForLabel, lineSpaing: 8, labelWidth: screenWidth - 20*2, font: UIFont.systemFont(ofSize: 14)) //设置行间距
        self.TestLabelH = TextForLabel.heightWithLabelFont(font: UIFont.systemFont(ofSize: 14), labelWidth: screenWidth - 20*2, lineSpacing: 8, label: testLabel)
        testLabel.frame = CGRect(x: 20, y: 20, width: screenWidth - 20*2, height: self.TestLabelH)
        testLabel.isHidden = self.TestLabelH == 0
        self.scrollView.addSubview(testLabel)
    }
    
    fileprivate func addSingleLineLabel() {
        
        self.singleLineLabel = UILabel()
        singleLineLabel.backgroundColor = UIColor.lightGray
        singleLineLabel.text = "这是单行文本。"
        singleLineLabel.numberOfLines = 0
        singleLineLabel.font = UIFont.systemFont(ofSize: 14)
        singleLineLabel.textAlignment = .left
        
        self.SingleLineLabelH = singleLineLabel.text!.heightWithLabelFont(font: UIFont.systemFont(ofSize: 14))
        singleLineLabel.frame = CGRect(x: 20, y: (self.testLabel.isHidden == true ? 0 : self.testLabel.frame.maxY) + 20, width: screenWidth - 20*2, height: self.SingleLineLabelH)
        self.singleLineLabel.isHidden = self.SingleLineLabelH == 0
        self.scrollView.addSubview(singleLineLabel)
    }
}







