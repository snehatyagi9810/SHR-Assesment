//
//  NewTableViewCell.swift
//  SHR Assesment
//
//  Created by Sneh  on 03/09/24.
//

import UIKit
import SDWebImage

class NewTableViewCell: UITableViewCell {
    @IBOutlet weak var totalCommentLabel: UILabel!
    @IBOutlet weak var totalLikesLabel: UILabel!
    @IBOutlet weak var feedUserPicImage: UIImageView!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var feedUserNameLabel: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var feedDateLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var feedTypeNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        feedUserPicImage.layer.cornerRadius = feedUserPicImage.bounds.width / 2
        feedUserPicImage.clipsToBounds  = true
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        storyImage.image = nil
        feedUserPicImage.image = nil
    }
    
    
    func configureCell(article: Article) {
        
       
            feedUserPicImage.sd_setImage(with: URL(string: article.feedUserPic ?? ""))
        
            storyImage.sd_setImage(with: URL(string: article.story_img ?? "") )
   
        cityNameLabel.text = article.cityName
        feedDateLabel.text = article.feedDate
        feedUserNameLabel.text = article.feedUserName
        articleDescriptionLabel.text = article.description
        feedTypeNameLabel.text = article.feed_type_name
        nameLabel.text = article.name
        totalLikesLabel.text = "Likes (\(article.totalLikes ?? 0))"
        totalCommentLabel.text = "Comments (\(article.totalComments ?? 0))"
        
        
        
        
    }

    
}
