//
//  SerachViewController.swift
//  PSUIKIT
//
//  Created by Jedidiaz Fagundez on 18/06/24.
//

import UIKit

class SerachViewController: UIViewController {

    //MARK: - Oulets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    //Variables
    var textSearch = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Serach"
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func SearchAction(_ sender: UIButton) {
        print(textSearch)
    }
}

//MARK: - UITextFieldDelegate
extension SerachViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.textSearch = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
}
