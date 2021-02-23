//
//  DetailViewController.swift
//  Consolidation2
//
//  Created by Alexander Filippov on 23.2.21..
//  Copyright © 2021 Alexander Filippov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var flagImage: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        flagImage.layer.borderWidth = 1
        flagImage.layer.borderColor = UIColor.lightGray.cgColor
    
        
        if let imageToLoad = selectedImage {
            flagImage.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped () {
           guard let image = flagImage.image?.jpegData(compressionQuality: 0.8) else {
               print("No image found.")
               return
           }

           guard let imageName = selectedImage else { return }
           
           let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
           vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
           present(vc, animated: true)
       }
    
}
