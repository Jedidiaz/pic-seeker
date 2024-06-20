//
//  SerachViewController.swift
//  PSUIKIT
//
//  Created by Jedidiaz Fagundez on 18/06/24.
//

import UIKit
import Kingfisher

final class SearchViewController: UIViewController {
    
    //MARK: - Oulets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    //Enums
    enum ImageServices {
        case unsplash
        case flickr
    }
    
    //Variables
    var currentService: ImageServices = .unsplash
    var images: [ImageObject] = []
    private let kImageCellName = "ImageCollectionViewCell"
    private let kInitLabelText = "Discover a world of visual possibilities in our image bank. Each photo tells a story, what will be yours?"
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let cellWidth = (UIScreen.main.bounds.width/2) - 16
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 6
        layout.minimumLineSpacing = 6
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 0, right: 3)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        return layout
    }()
    
    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Ui
        self.title = "Serach"
        imageCollectionView.register(UINib(nibName: kImageCellName, bundle: .main), forCellWithReuseIdentifier: kImageCellName)
        imageCollectionView.collectionViewLayout = collectionViewLayout
        
        //Delegates
        self.searchTextField.delegate = self
        self.imageCollectionView.delegate = self
        
        //Datasources
        imageCollectionView.dataSource = self
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
    
    private func checkEmptyImageList () {
        if !images.isEmpty {
            self.hiddeViewAnimated(view: self.infoView)
            self.hiddeViewAnimated(isHidden: false, view: self.imageContainerView)
            return
        }
        
        self.infoLabel.text = "Upps!! images not found."
        self.hiddeViewAnimated(view: self.imageContainerView)
        self.hiddeViewAnimated(isHidden: false, view: self.infoView)
    }
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        UnsplashService.kShared.getImagesTo(query: text) { images in
            self.images = images
            self.checkEmptyImageList()
            DispatchQueue.main.async {
                self.imageCollectionView.reloadData()
            }
        } failure: { error in
            print(error!)
        }
        
    }
}

//MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: kImageCellName, for: indexPath) as? ImageCollectionViewCell
        
        if let imageUrl = URL(string: images[indexPath.row].urls?.regular ?? ""){
            cell?.imageView.kf.setImage(with: imageUrl)
        }
        return cell!
    }
}

//MARK: -
extension SearchViewController: UICollectionViewDelegate {
    
}
