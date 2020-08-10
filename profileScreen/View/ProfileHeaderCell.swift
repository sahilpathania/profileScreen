//
//  ProfileHeaderCell.swift
//  profileScreen
//
//  Created by sahil pathania on 19/01/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var pointsCount: UILabel!
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followingLbl: UILabel!
    @IBOutlet weak var overflowBtn: UIButton!
    @IBOutlet weak var profilePicImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var postBookmarksView: UIView!
    @IBOutlet weak var writeAPostBtn: UIButton!
    @IBOutlet weak var viewBookmarkBtn: UIButton!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var socialMediaView: UIView!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var instaBtn: UIButton!
    @IBOutlet weak var webBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profilePicImg.layer.cornerRadius = profilePicImg.frame.height / 2
        profilePicImg.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        profilePicImg.layer.borderWidth = 4
        starBtn.layer.cornerRadius = starBtn.frame.height / 2
        writeAPostBtn.layer.cornerRadius = writeAPostBtn.frame.height / 2
        writeAPostBtn.layer.borderColor = #colorLiteral(red: 0, green: 0.8205631375, blue: 0.5961772799, alpha: 1)
        writeAPostBtn.layer.borderWidth = 1
        
        viewBookmarkBtn.layer.cornerRadius = viewBookmarkBtn.frame.height / 2
        viewBookmarkBtn.layer.borderColor = #colorLiteral(red: 0, green: 0.8205631375, blue: 0.5961772799, alpha: 1)
        viewBookmarkBtn.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
