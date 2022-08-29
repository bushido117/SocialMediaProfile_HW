//
//  ProfileInfoView.swift
//  Social_media_profile_HW
//
//  Created by Вадим Сайко on 28.08.22.
//

import UIKit

//Попробовать UITextFieldDelegate

protocol TopViewDelegate: AnyObject {
    func textFieldResignFirstResponder(_ textField: UITextField)
}

class ProfileInfoView: UIView, UITextFieldDelegate {
    
    weak var topViewDelegate: TopViewDelegate?

    lazy var mainTopStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution = UIStackView.Distribution.fillProportionally
        stack.alignment = UIStackView.Alignment.center
        return stack
    }()
    
    lazy var stackForLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    lazy var stackForTextFields: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.spacing = 6
        return stack
    }()
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        return imageView
    }()

    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "First"
        label.textAlignment = .center
        return label
    }()
    
    lazy var middleLabel: UILabel = {
        let label = UILabel()
        label.text = "Middle"
        label.textAlignment = .center
        return label
    }()
    
    lazy var lastLabel: UILabel = {
        let label = UILabel()
        label.text = "Last"
        label.textAlignment = .center
        return label
    }()
    
    lazy var firstTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter First Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var middleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Middle Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var lastTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Last Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        
        firstTextField.delegate = self
        middleTextField.delegate = self
        lastTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        mainTopStack.translatesAutoresizingMaskIntoConstraints = false
        mainTopStack.bottomAnchor.constraint(equalTo:  self.bottomAnchor).isActive = true
        mainTopStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainTopStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainTopStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        avatar.widthAnchor.constraint(equalTo: mainTopStack.widthAnchor, multiplier: 0.35).isActive = true
        
        stackForLabels.widthAnchor.constraint(equalTo: mainTopStack.widthAnchor, multiplier: 0.15).isActive = true
        stackForLabels.heightAnchor.constraint(equalTo: mainTopStack.heightAnchor).isActive = true
        
        stackForTextFields.heightAnchor.constraint(equalTo: mainTopStack.heightAnchor).isActive = true
        super.updateConstraints()
    }
    
    func addSubviews() {
        stackForLabels.addArrangedSubview(firstLabel)
        stackForLabels.addArrangedSubview(middleLabel)
        stackForLabels.addArrangedSubview(lastLabel)
        stackForTextFields.addArrangedSubview(firstTextField)
        stackForTextFields.addArrangedSubview(middleTextField)
        stackForTextFields.addArrangedSubview(lastTextField)
        mainTopStack.addArrangedSubview(avatar)
        mainTopStack.addArrangedSubview(stackForLabels)
        mainTopStack.addArrangedSubview(stackForTextFields)
        addSubview(mainTopStack)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        topViewDelegate?.textFieldResignFirstResponder(textField)
    }
}
