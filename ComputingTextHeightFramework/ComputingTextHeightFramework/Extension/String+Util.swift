//
//  String+Util.swift
//  ComputingTextHeightFramework
//
//  Created by JOE on 2018/4/13.
//  Copyright © 2018年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

extension String {
    
    //MARK: - 计算单行文本的高度
    
    ///计算单行文本的高度
    func heightWithLabelFont(font: UIFont) -> CGFloat {
        
        var height:CGFloat = 0.0
        
        if self.count == 0 {
            height = 0.0
        } else {
            let rectSize = (self as NSString).size(withAttributes: [NSAttributedStringKey.font : font])
            height = rectSize.height
        }
        return height
    }
    
    //MARK: - 计算多行文本的高度
    
    ///计算多行文本的高度
    func heightWithLabelFont(font: UIFont, labelWidth: CGFloat, lineSpacing: CGFloat = 0.0, label: UILabel = UILabel()) -> CGFloat {
        
        var height:CGFloat = 0.0
        
        if self.count == 0 {
            height = 0.0
        } else {
            var options = NSStringDrawingOptions()
            options = [NSStringDrawingOptions.usesLineFragmentOrigin, NSStringDrawingOptions.truncatesLastVisibleLine, NSStringDrawingOptions.usesFontLeading]
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            let attributes = [NSAttributedStringKey.font : font, NSAttributedStringKey.paragraphStyle : paragraphStyle]
            
            //判断单行多行
            if !self.singleLine(font: font, labelWidth: labelWidth, label: label) {
                //计算文本高度,文本有多行
                let rectSize = (self as NSString).boundingRect(with: CGSize(width: labelWidth, height: CGFloat(MAXFLOAT)), options: options, attributes: attributes, context: nil).size
                height = rectSize.height
            } else {
                //计算文本高度,文本只有一行
                height = self.heightWithLabelFont(font: font)
            }
        }
        print("多行文本的高度 height: \(height)")
        return height
    }
    
    //MARK: - 判断如果包含中文
    
    ///判断如果包含中文
    func containChinese(str: String) -> Bool {
        
        for i in 0..<str.count {
            let a = (str as NSString).character(at: i)
            if a > 0x4e00 && a < 0x9fff {
                return true
            }
        }
        return false
    }
    
    //MARK: - 判断单行多行
    func singleLine(font: UIFont, labelWidth: CGFloat, label: UILabel = UILabel()) -> Bool {
        
        let size = label.sizeThatFits(CGSize(width: labelWidth, height: CGFloat(MAXFLOAT)))
        if size.height < CGFloat(2) * font.lineHeight  {
            //计算文本高度,文本只有一行
            return true
        } else {
            //计算文本高度,文本有多行
            return false
        }
    }
}











