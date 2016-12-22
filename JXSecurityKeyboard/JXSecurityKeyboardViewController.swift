//
//  JXSecurityKeyboardViewController.swift
//  JXSecurityKeyboard
//
//  Created by XiaoLai－JX on 16/12/20.
//  Copyright © 2016年 XiaoLai－JX. All rights reserved.
//

import UIKit

class JXSecurityKeyboardViewController: UIViewController,JXSecurityKeyboardProtocol {
    
    
    //键盘高度宽度
    private var ScreenWidth:CGFloat! = UIScreen.main.bounds.width
    private var ScreenHeight:CGFloat! = UIScreen.main.bounds.height
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextField1: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    
    //懒加载标题
    private lazy var JXtitleStr:String! = {
        return "JXSecurityKeyboard"
    }()
    //懒加附件栏accessory
    private lazy var JXAccessoryView:UILabel! = {
        let headerLabel = UILabel()
        headerLabel.backgroundColor = UIColor.white
        headerLabel.text = self.JXtitleStr
        headerLabel.textColor = UIColor.black
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.systemFont(ofSize: 14.0)
        headerLabel.isUserInteractionEnabled = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        let doneBtn = UIButton()
        doneBtn.setTitle("完成", for: .normal)
        doneBtn.setTitleColor(UIColor.blue, for: .normal)
        doneBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        doneBtn.addTarget(self, action: #selector(self.doneBtnTap), for: .touchUpInside)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.addSubview(doneBtn)
        //布局
        let widthConstraint1 = NSLayoutConstraint(item: doneBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0)
        let heigtConstraint1 = NSLayoutConstraint(item: doneBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0)
        doneBtn.addConstraints([widthConstraint1,heigtConstraint1])
        let topConstraint = NSLayoutConstraint(item: doneBtn, attribute: .top, relatedBy: .equal, toItem: headerLabel, attribute: .top, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: doneBtn, attribute: .right, relatedBy: .equal, toItem: headerLabel, attribute: .right, multiplier: 1.0, constant: -15.0)
        //header布局
        let widthConstraint = NSLayoutConstraint(item: headerLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.ScreenWidth)
        let heigtConstraint = NSLayoutConstraint(item: headerLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0)
        headerLabel.addConstraints([topConstraint,rightConstraint,widthConstraint,heigtConstraint])
        return headerLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        //注册监听键盘弹出
        NotificationCenter.default.addObserver(self, selector: #selector(self.exchangeKeyboardView(notify:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.KeyboardViewWillHide(notify:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.myTextField.isSecureTextEntry = true
        //使用安全键盘
        self.myTextField.inputAccessoryView = self.JXAccessoryView
        let inputView = JXSecurityInputView.init(frame: CGRect(x: 0, y: self.ScreenHeight * 0.7, width: self.ScreenWidth, height: self.ScreenHeight * 0.3))
        inputView.JXSecurityKeyboardDelegate = self
        self.myTextField.inputView = inputView
        
        myTextField1.keyboardType = .decimalPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func exchangeKeyboardView(notify:NSNotification) {
        //通知里的内容
        let userInfo = notify.userInfo as? NSDictionary
        
        let aValue = userInfo!.object(forKey: UIKeyboardFrameEndUserInfoKey)
        
        let keyboardRect = (aValue as AnyObject).cgRectValue
        print(keyboardRect!)
        self.reloadLayout(frame: keyboardRect!)
    }
    func KeyboardViewWillHide(notify:NSNotification) {
        //重新布局
        for item in self.view.constraints {
            if item.secondItem as? UIView == self.view {
                if item.firstAttribute == NSLayoutAttribute.bottom {
                    self.view.removeConstraint(item)
                    //重新布局
                    let bottomConstraint = NSLayoutConstraint(item: self.myTextField2, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -150.0)
                    self.view.addConstraint(bottomConstraint)
                    UIView.animate(withDuration: 0.5, animations: {
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
    }
    
    //单击完成
    func doneBtnTap() {
        print(self.myTextField.text!)
        self.myTextField.resignFirstResponder()
    }
    //单机空白
    func sendNumber(str: String!) {
        print(str)
        if str == "delete" {
            if self.myTextField.text != "" {
                let s = NSMutableString(string: self.myTextField.text!)
                let length = s.length
                let range = NSRange(location: length - 1, length: 1)
                s.replaceCharacters(in: range, with: "")
                self.myTextField.text = s as String
            }
        }else{
            if self.myTextField.text == "" {
                self.myTextField.text = str
            }else{
                let s = self.myTextField.text!
                let newStr = s.appending(str)
                self.myTextField.text = newStr
            }
        }
    }
    
    //被遮挡处理
    func reloadLayout(frame:CGRect!) {
        let itemArray = [self.myTextField,self.myTextField1,self.myTextField2]
        for item in itemArray {
            if item!.frame.origin.y >= frame.origin.y {
                //重新布局
                let bottomConstraint = NSLayoutConstraint(item: item!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -(frame.size.height + 30.0))
                self.view.addConstraint(bottomConstraint)
                UIView.animate(withDuration: 0.5, animations: { 
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
}
