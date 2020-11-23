//
//  EntryViewController.swift
//  BuildListApp
//
//  Created by Dennis Petlakh on 10/1/20.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var listField: UITextView!
    
    public var completion: ((String, String) -> Void)?


    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !listField.text.isEmpty {
            completion?(text, listField.text)
        }
    }
}
