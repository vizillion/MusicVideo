//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by Tuan-Vi Phan on 3/28/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {

    var video: Videos? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    
    func updateCell() {
        
        musicTitle.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        rank.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
        musicTitle.text = video?.vName
        rank.text = ("\(video!.vRank)")
        //musicImage.image = UIImage(named:"imageNotAvailable")
        
        if video!.vImageData != nil {
            print("Get data from array ...")
            musicImage.image = UIImage(data: video!.vImageData!)
        } else {
            GetVideoImage(video!, imageView: musicImage)
            print("Get images in background thread")
        }
    }
    
    func GetVideoImage(video: Videos, imageView: UIImageView) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            let data = NSData(contentsOfURL: NSURL(string: video.vImageUrl)!)
            var image: UIImage?
            if data != nil {
                video.vImageData = data
                image = UIImage(data: data!)
            }
            
            // move back to Main Queue
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                imageView.image = image
            })
        }
    }
    
    
    
    
    
}
