//
//  ViewController.swift
//  VKclient
//
//  Created by Aleksandr  on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var OpenButton: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    let fromlogin = "fromLoginToTabBar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHeight), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
    }
    
    @objc func keyboardShow(_ notification: Notification) {
        guard let keyboardHeight = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue)?.height else { return }
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 100, right: 0)
        
        ScrollView.contentInset = insets
        ScrollView.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardDidHeight() {
        ScrollView.contentInset = UIEdgeInsets.zero
        ScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func onTap() {
        self.view.endEditing(true)
    }
    
    @IBAction func ActionOpenButton(_ sender: Any) {
        guard let login = LoginTextField.text,
              let password = PasswordTextField.text else { return }
        
        if login == "1",
           password == "1" {
            print("ok")
            performSegue(withIdentifier: fromlogin, sender: nil)
        } else {
            print("login error")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
