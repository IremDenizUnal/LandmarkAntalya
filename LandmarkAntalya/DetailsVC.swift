//
//  DetailsVC.swift
//  LandmarkAntalya
//
//  Created by ırem denız on 18.03.2024.
//

import UIKit

class DetailsVC: UIViewController {

    
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    

    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
            
    override func viewDidLoad() {
    super.viewDidLoad()
                
    detailsLabel.text = selectedLandmarkName
    imageView.image = selectedLandmarkImage

        
    }
    

    

}
