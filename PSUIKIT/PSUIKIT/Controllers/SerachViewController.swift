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
    @IBOutlet weak var infoView: UIView!
    
    //Enums
    enum ImageServices {
        case unsplash
        case flickr
    }
    
    //Variables
    var textSearch = ""
    var currentService: ImageServices = .unsplash
    
    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Serach"
        
        //Delegates
        self.searchTextField.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func SearchAction(_ sender: UIButton) {
        switch currentService {
        case .unsplash:
            currentService = .flickr
            changeTitleAnimated(title: "Flickr", button: sender)
        case .flickr:
            currentService = .unsplash
            changeTitleAnimated(title: "Unsplash", button: sender)
        }
    }
    
    //MARK: - Prvate methods
    private func changeTitleAnimated (title: String, button: UIButton) {
        // Created instance of CATransition
        let transition = CATransition()
        transition.type = .reveal
        transition.duration = 0.1
        transition.timingFunction = CAMediaTimingFunction(name: .linear)

        // Apply transition to searchButton
        button.layer.add(transition, forKey: kCATransition)
        
        // Change title
        button.setTitle(title, for: .normal)
    }
    
    private func hiddeViewAnimated (isHidden: Bool = true, view: UIView) {
        // Created instance of CATransition
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.1
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        // Apply transition to searchButton
        view.layer.add(transition, forKey: kCATransition)
        
        view.isHidden = isHidden
    }
}

//MARK: - UITextFieldDelegate
extension SerachViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        UnsplashService.kShared.getImagesTo(query: text) { images in
            self.hiddeViewAnimated(view: self.infoView)
            print(images)
        } failure: { error in
            print(error!)
        }

    }
}
