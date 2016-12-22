//
//  JXSecurityInputView.swift
//  JXSecurityKeyboard
//
//  Created by XiaoLai－JX on 16/12/20.
//  Copyright © 2016年 XiaoLai－JX. All rights reserved.
//

import UIKit

protocol JXSecurityKeyboardProtocol {
    func sendNumber(str:String!)
}

class JXSecurityInputView: UIView {
    
    var JXSecurityKeyboardDelegate:JXSecurityKeyboardProtocol?
    
    //键盘高度宽度
    private var JXInputViewWidth:CGFloat! = UIScreen.main.bounds.width
    private var JXInputViewHeight:CGFloat!
    
    //懒加载数字列表
    private lazy var JXNumberMutableArray:NSMutableArray! = {
        var startArray = NSMutableArray(array: [0,1,2,3,4,5,6,7,8,9])
        var resultArray = NSMutableArray()
        for i in 0..<startArray.count {
            let t = arc4random() % UInt32(startArray.count)
            resultArray[i] = startArray[Int(t)]
            startArray[Int(t)] = startArray.lastObject as Any
            startArray.removeLastObject()
        }
        return resultArray
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if self.JXInputViewHeight == nil {
            self.JXInputViewHeight = frame.size.height
        }
        print(self.JXInputViewHeight)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setBtnAndConstraint()
        self.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///设置按钮及约束
    func setBtnAndConstraint() {
        //Btn1
        let button1 = UIButton()
        button1.backgroundColor = UIColor.white
        button1.setTitle("\(self.JXNumberMutableArray[0] as! Int)", for: .normal)
        button1.setTitleColor(UIColor.darkText, for: .normal)
        button1.tag = self.JXNumberMutableArray[0] as! Int
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button1)
        //Btn2
        let button2 = UIButton()
        button2.backgroundColor = UIColor.white
        button2.setTitle("\(self.JXNumberMutableArray[1] as! Int)", for: .normal)
        button2.setTitleColor(UIColor.darkText, for: .normal)
        button2.tag = self.JXNumberMutableArray[1] as! Int
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button2)
        //Btn3
        let button3 = UIButton()
        button3.backgroundColor = UIColor.white
        button3.setTitle("\(self.JXNumberMutableArray[2] as! Int)", for: .normal)
        button3.setTitleColor(UIColor.darkText, for: .normal)
        button3.tag = self.JXNumberMutableArray[2] as! Int
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button3)
        //Btn4
        let button4 = UIButton()
        button4.backgroundColor = UIColor.white
        button4.setTitle("\(self.JXNumberMutableArray[3] as! Int)", for: .normal)
        button4.setTitleColor(UIColor.darkText, for: .normal)
        button4.tag = self.JXNumberMutableArray[3] as! Int
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button4)
        //Btn5
        let button5 = UIButton()
        button5.backgroundColor = UIColor.white
        button5.setTitle("\(self.JXNumberMutableArray[4] as! Int)", for: .normal)
        button5.setTitleColor(UIColor.darkText, for: .normal)
        button5.tag = self.JXNumberMutableArray[4] as! Int
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button5)
        //Btn6
        let button6 = UIButton()
        button6.backgroundColor = UIColor.white
        button6.setTitle("\(self.JXNumberMutableArray[5] as! Int)", for: .normal)
        button6.setTitleColor(UIColor.darkText, for: .normal)
        button6.tag = self.JXNumberMutableArray[5] as! Int
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button6)
        //Btn7
        let button7 = UIButton()
        button7.backgroundColor = UIColor.white
        button7.setTitle("\(self.JXNumberMutableArray[6] as! Int)", for: .normal)
        button7.setTitleColor(UIColor.darkText, for: .normal)
        button7.tag = self.JXNumberMutableArray[6] as! Int
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button7)
        //Btn8
        let button8 = UIButton()
        button8.backgroundColor = UIColor.white
        button8.setTitle("\(self.JXNumberMutableArray[7] as! Int)", for: .normal)
        button8.setTitleColor(UIColor.darkText, for: .normal)
        button8.tag = self.JXNumberMutableArray[7] as! Int
        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button8)
        //Btn9
        let button9 = UIButton()
        button9.backgroundColor = UIColor.white
        button9.setTitle("\(self.JXNumberMutableArray[8] as! Int)", for: .normal)
        button9.setTitleColor(UIColor.darkText, for: .normal)
        button9.tag = self.JXNumberMutableArray[8] as! Int
        button9.translatesAutoresizingMaskIntoConstraints = false
        button9.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button9)
        //Btn10
        let button10 = UIButton()
        button10.backgroundColor = UIColor.gray
        button10.setTitle("", for: .normal)
        button10.setTitleColor(UIColor.darkText, for: .normal)
        button10.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button10)
        //Btn11
        let button11 = UIButton()
        button11.backgroundColor = UIColor.white
        button11.setTitle("\(self.JXNumberMutableArray[9] as! Int)", for: .normal)
        button11.setTitleColor(UIColor.darkText, for: .normal)
        button11.tag = self.JXNumberMutableArray[9] as! Int
        button11.translatesAutoresizingMaskIntoConstraints = false
        button11.addTarget(self, action: #selector(self.numberTap(sender:)), for: .touchUpInside)
        self.addSubview(button11)
        //Btn12
        let button12 = UIButton()
        button12.backgroundColor = UIColor.white
        button12.setTitle("删除", for: .normal)
        button12.setTitleColor(UIColor.darkText, for: .normal)
        button12.translatesAutoresizingMaskIntoConstraints = false
        button12.addTarget(self, action: #selector(self.deleteBtnTap), for: .touchUpInside)
        self.addSubview(button12)
        //宽度高度约束
        let widthConstraint1 = NSLayoutConstraint(item: button1, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.JXInputViewWidth / 3.0)
        let heightConstraint1 = NSLayoutConstraint(item: button1, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.JXInputViewHeight / 4.0)
        button1.addConstraints([widthConstraint1,heightConstraint1])
        
        //Btn1约束
        let topConstraint1 = NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 1.0)
        //btn1距离self左间距
        let leftConstraint1 = NSLayoutConstraint(item: button1, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        //btn2距离两侧间距
        let leftMargin2 = NSLayoutConstraint(item: button2, attribute: .left, relatedBy: .equal, toItem: button1, attribute: .right, multiplier: 1.0, constant: 1.0)
        let topConstraint2 = NSLayoutConstraint(item: button2, attribute: .top, relatedBy: .equal, toItem: button1, attribute: .top, multiplier: 1.0, constant: 0.0)
//        let bottomConstraint2 = NSLayoutConstraint(item: button2, attribute: .bottom, relatedBy: .equal, toItem: button1, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint2 = NSLayoutConstraint(item: button2, attribute: .width, relatedBy: .equal, toItem: button1, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint2 = NSLayoutConstraint(item: button2, attribute: .height, relatedBy: .equal, toItem: button1, attribute: .height, multiplier: 1.0, constant: 0.0)
        //btn3距离self右间距
        let rightConstraint3 = NSLayoutConstraint(item: button3, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
        let leftMargin3 = NSLayoutConstraint(item: button3, attribute: .left, relatedBy: .equal, toItem: button2, attribute: .right, multiplier: 1.0, constant: 1.0)
        let topConstraint3 = NSLayoutConstraint(item: button3, attribute: .top, relatedBy: .equal, toItem: button2, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint3 = NSLayoutConstraint(item: button3, attribute: .bottom, relatedBy: .equal, toItem: button2, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint3 = NSLayoutConstraint(item: button3, attribute: .width, relatedBy: .equal, toItem: button2, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint3 = NSLayoutConstraint(item: button3, attribute: .height, relatedBy: .equal, toItem: button2, attribute: .height, multiplier: 1.0, constant: 0.0)
        //btn4
        let topConstraint4 = NSLayoutConstraint(item: button4, attribute: .top, relatedBy: .equal, toItem: button1, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint4 = NSLayoutConstraint(item: button4, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        let widthConstraint4 = NSLayoutConstraint(item: button4, attribute: .width, relatedBy: .equal, toItem: button1, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint4 = NSLayoutConstraint(item: button4, attribute: .height, relatedBy: .equal, toItem: button1, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint4,leftConstraint4,widthConstraint4,heightConstraint4])
        //btn5
        let topConstraint5 = NSLayoutConstraint(item: button5, attribute: .top, relatedBy: .equal, toItem: button2, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint5 = NSLayoutConstraint(item: button5, attribute: .left, relatedBy: .equal, toItem: button4, attribute: .right, multiplier: 1.0, constant: 1.0)
        let widthConstraint5 = NSLayoutConstraint(item: button5, attribute: .width, relatedBy: .equal, toItem: button4, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint5 = NSLayoutConstraint(item: button5, attribute: .height, relatedBy: .equal, toItem: button4, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint5,leftConstraint5,widthConstraint5,heightConstraint5])
        //btn6
        let topConstraint6 = NSLayoutConstraint(item: button6, attribute: .top, relatedBy: .equal, toItem: button3, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint6 = NSLayoutConstraint(item: button6, attribute: .left, relatedBy: .equal, toItem: button5, attribute: .right, multiplier: 1.0, constant: 1.0)
        let widthConstraint6 = NSLayoutConstraint(item: button6, attribute: .width, relatedBy: .equal, toItem: button5, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint6 = NSLayoutConstraint(item: button6, attribute: .height, relatedBy: .equal, toItem: button5, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint6,leftConstraint6,widthConstraint6,heightConstraint6])
        //btn7
        let topConstraint7 = NSLayoutConstraint(item: button7, attribute: .top, relatedBy: .equal, toItem: button4, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint7 = NSLayoutConstraint(item: button7, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        let widthConstraint7 = NSLayoutConstraint(item: button7, attribute: .width, relatedBy: .equal, toItem: button4, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint7 = NSLayoutConstraint(item: button7, attribute: .height, relatedBy: .equal, toItem: button4, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint7,leftConstraint7,widthConstraint7,heightConstraint7])
        //btn8
        let topConstraint8 = NSLayoutConstraint(item: button8, attribute: .top, relatedBy: .equal, toItem: button5, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint8 = NSLayoutConstraint(item: button8, attribute: .left, relatedBy: .equal, toItem: button7, attribute: .right, multiplier: 1.0, constant: 1.0)
        let widthConstraint8 = NSLayoutConstraint(item: button8, attribute: .width, relatedBy: .equal, toItem: button7, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint8 = NSLayoutConstraint(item: button8, attribute: .height, relatedBy: .equal, toItem: button7, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint8,leftConstraint8,widthConstraint8,heightConstraint8])
        //btn9
        let topConstraint9 = NSLayoutConstraint(item: button9, attribute: .top, relatedBy: .equal, toItem: button6, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint9 = NSLayoutConstraint(item: button9, attribute: .left, relatedBy: .equal, toItem: button8, attribute: .right, multiplier: 1.0, constant: 1.0)
        let widthConstraint9 = NSLayoutConstraint(item: button9, attribute: .width, relatedBy: .equal, toItem: button8, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint9 = NSLayoutConstraint(item: button9, attribute: .height, relatedBy: .equal, toItem: button8, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint9,leftConstraint9,widthConstraint9,heightConstraint9])
        //btn10
        let topConstraint10 = NSLayoutConstraint(item: button10, attribute: .top, relatedBy: .equal, toItem: button7, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint10 = NSLayoutConstraint(item: button10, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        let widthConstraint10 = NSLayoutConstraint(item: button10, attribute: .width, relatedBy: .equal, toItem: button7, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint10 = NSLayoutConstraint(item: button10, attribute: .height, relatedBy: .equal, toItem: button7, attribute: .height, multiplier: 1.0, constant: 0.0)
        let bottomConstraint10 = NSLayoutConstraint(item: button10, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint10,leftConstraint10,widthConstraint10,heightConstraint10,bottomConstraint10])
        //btn11
        let topConstraint11 = NSLayoutConstraint(item: button11, attribute: .top, relatedBy: .equal, toItem: button8, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint11 = NSLayoutConstraint(item: button11, attribute: .left, relatedBy: .equal, toItem: button10, attribute: .right, multiplier: 1.0, constant: 1.0)
        let widthConstraint11 = NSLayoutConstraint(item: button11, attribute: .width, relatedBy: .equal, toItem: button10, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint11 = NSLayoutConstraint(item: button11, attribute: .height, relatedBy: .equal, toItem: button10, attribute: .height, multiplier: 1.0, constant: 0.0)
        let bottomConstraint11 = NSLayoutConstraint(item: button11, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint11,leftConstraint11,widthConstraint11,heightConstraint11,bottomConstraint11])
        //btn12
        let topConstraint12 = NSLayoutConstraint(item: button12, attribute: .top, relatedBy: .equal, toItem: button9, attribute: .bottom, multiplier: 1.0, constant: 1.0)
        let leftConstraint12 = NSLayoutConstraint(item: button12, attribute: .left, relatedBy: .equal, toItem: button11, attribute: .right, multiplier: 1.0, constant: 1.0)
        let widthConstraint12 = NSLayoutConstraint(item: button12, attribute: .width, relatedBy: .equal, toItem: button11, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint12 = NSLayoutConstraint(item: button12, attribute: .height, relatedBy: .equal, toItem: button11, attribute: .height, multiplier: 1.0, constant: 0.0)
        let bottomConstraint12 = NSLayoutConstraint(item: button12, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        self.addConstraints([topConstraint12,leftConstraint12,widthConstraint12,heightConstraint12,bottomConstraint12])
        self.addConstraints([topConstraint1,topConstraint2,topConstraint3,/*bottomConstraint2,*/bottomConstraint3,leftConstraint1,leftMargin2,leftMargin3,rightConstraint3,widthConstraint2,heightConstraint2,widthConstraint3,heightConstraint3])
    }
    func numberTap(sender:UIButton!) {
        if self.JXSecurityKeyboardDelegate != nil {
            self.JXSecurityKeyboardDelegate?.sendNumber(str: "\(sender.tag)")
        }
    }
    func deleteBtnTap() {
        if self.JXSecurityKeyboardDelegate != nil {
            self.JXSecurityKeyboardDelegate?.sendNumber(str: "delete")
        }
    }
}
