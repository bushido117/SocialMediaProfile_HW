//
//  BottomButtonsView.swift
//  Social_media_profile_HW
//
//  Created by Вадим Сайко on 28.08.22.
//

import UIKit

protocol BottomViewDelegate: AnyObject {
    func addTextToTextView (_ button: UIButton)
}

class BottomButtonsView: UIView {
    
    weak var bottomViewDelegate: BottomViewDelegate?

    lazy var bottomButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.alignment = UIStackView.Alignment.center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTap), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTap), for: .touchUpInside)
        return button
    }()
    
    lazy var cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clean", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        bottomButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsStack.bottomAnchor.constraint(equalTo:  self.bottomAnchor).isActive = true
        bottomButtonsStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bottomButtonsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomButtonsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        super.updateConstraints()
    }
    
    func addSubviews() {
        bottomButtonsStack.addArrangedSubview(saveButton)
        bottomButtonsStack.addArrangedSubview(cancelButton)
        bottomButtonsStack.addArrangedSubview(cleanButton)
        addSubview(bottomButtonsStack)
    }
    
    @objc func saveButtonTap() {
        bottomViewDelegate?.addTextToTextView(saveButton)
    }
    
    @objc func cancelButtonTap() {
        
    }
    
    @objc func cleanButtonTap() {
        
    }
}
