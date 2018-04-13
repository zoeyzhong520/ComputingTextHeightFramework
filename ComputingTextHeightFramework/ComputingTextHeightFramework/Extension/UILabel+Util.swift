//
//  UILabel+Util.swift
//  ComputingTextHeightFramework
//
//  Created by JOE on 2018/4/13.
//  Copyright © 2018年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

extension UILabel {
    
    //MARK: - 设置文本,并指定行间距
    
    ///设置文本,并指定行间距
    func setText(text: String?, lineSpaing: CGFloat, labelWidth: CGFloat = 0.0, font: UIFont = UIFont.systemFont(ofSize: 14)) {
        
        if text == nil || lineSpaing < 0.01 {
            self.text = text
            return
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        //判断单行多行
        if !text!.singleLine(font: font, labelWidth: labelWidth, label: self) {
            //计算文本高度,文本有多行
            paragraphStyle.lineSpacing = lineSpaing //设置行间距
        }
        paragraphStyle.lineBreakMode = self.lineBreakMode
        paragraphStyle.alignment = self.textAlignment
        
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, text!.count))
        self.attributedText = attributedString
    }
    
    
}
















