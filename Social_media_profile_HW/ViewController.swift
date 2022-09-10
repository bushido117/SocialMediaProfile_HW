//
//  ViewController.swift
//  Social_media_profile_HW
//
//  Created by Вадим Сайко on 28.08.22.
//

import UIKit

class ViewController: UIViewController, TopViewDelegate, BottomViewDelegate {
    
    var text: String = ""
//    var text: String?
    
        
    lazy var profileInfoView = ProfileInfoView()
    lazy var bottomButtonsView = BottomButtonsView()
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Enter your notes:"
        textView.textColor = UIColor.black
        textView.backgroundColor = .gray
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Profile"
        addSubviews()
        
        profileInfoView.topViewDelegate = self
        bottomButtonsView.bottomViewDelegate = self
    }
    
    override func updateViewConstraints() {
        profileInfoView.translatesAutoresizingMaskIntoConstraints = false
        profileInfoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        profileInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        profileInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        profileInfoView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        bottomButtonsView.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
        bottomButtonsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        bottomButtonsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        bottomButtonsView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.bottomAnchor.constraint(equalTo: bottomButtonsView.topAnchor, constant: 0).isActive = true
        textView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        super.updateViewConstraints()
    }
    
    func addSubviews() {
        self.view.addSubview(profileInfoView)
        self.view.addSubview(bottomButtonsView)
        self.view.addSubview(textView)
    }
    
    func textFieldResignFirstResponder(_ textField: UITextField) {
        self.text += " " + (textField.text ?? "")
//        self.text = textField.text
    }
    
    func addTextToTextView(_ button: UIButton) {
        textView.text += self.text
        self.text = ""
//        textView.text = self.text
    }
}

