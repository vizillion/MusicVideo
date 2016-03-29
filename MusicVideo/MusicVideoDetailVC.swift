//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by Tuan-Vi Phan on 3/29/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {
    
    var videos: Videos!

    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var vGenre: UILabel!
    @IBOutlet weak var vPrice: UILabel!
    @IBOutlet weak var vRights: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = videos.vArtist
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenre.text = videos.vGenre
        
        if videos.vImageData != nil {
            videoImage.image = UIImage(data: videos.vImageData!)
        } else {
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "preferredFontChange", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

    func preferredFontChange() {
        print("The preferred Font has changed")
    }
    
    // Is called just as the object is about to be deallocated
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
}
