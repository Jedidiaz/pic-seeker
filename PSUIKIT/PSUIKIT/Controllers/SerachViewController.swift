//
//  SerachViewController.swift
//  PSUIKIT
//
//  Created by Jedidiaz Fagundez on 18/06/24.
//

import UIKit

class SerachViewController: UIViewController {

    // MARK: - Oulets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: - enums
    
    enum ImageServices {
        case unsplash
        case flickr
    }
    
    // Variables
    var textSearch = ""
    var currentService: ImageServices = .unsplash
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Serach"
        
        // Delegates
        self.searchTextField.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func SearchAction(_ sender: UIButton) {
        // Ui Animation
        // Created instance of CATransition
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.3 // Duración de la animación
        transition.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)

        // Apply transition to searchButton
        searchButton.layer.add(transition, forKey: kCATransition)
        
        // Delegates
        searchTextField.delegate = self
        switch currentService {
        case .unsplash:
            currentService = .flickr
            changeTitleAnimated(title: "Flickr", sender: sender)
        case .flickr:
            currentService = .unsplash
            changeTitleAnimated(title: "Unsplash", sender: sender)
        }
    }
    
    // MARK: - Prvate methods
    
    private func changeTitleAnimated (title: String, sender: UIButton) {
        // Created instance of CATransition
        let transition = CATransition()
        transition.type = .reveal
        transition.duration = 0.1
        transition.timingFunction = CAMediaTimingFunction(name: .linear)

        // Apply transition to searchButton
        sender.layer.add(transition, forKey: kCATransition)
        
        // Change title
        sender.setTitle(title, for: .normal)
    }
}

// MARK: - UITextFieldDelegate

extension SerachViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    }
}
