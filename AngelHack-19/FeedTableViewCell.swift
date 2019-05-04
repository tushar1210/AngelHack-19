//
//  FeedTableViewCell.swift
//  
//
//  Created by Tushar Singh on 04/05/19.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UITextView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var tag1Label: UILabel!
    @IBOutlet var tag2Label: UILabel!
    @IBOutlet var upvoteButton: UIButton!
    @IBOutlet var downvoteButton: UIButton!
    @IBOutlet var upvoteLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        statusLabel.layer.borderWidth = 2.0
        statusLabel.layer.cornerRadius = 7.0
        statusLabel.layer.borderColor = UIColor(red: 80/255, green: 173/255, blue: 42/255, alpha: 1).cgColor
        tag1Label.layer.cornerRadius = 10
        tag2Label.layer.cornerRadius = 20
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func upvoteButton(sender: AnyObject) {
    }
    @IBAction func downvoteButton(sender: AnyObject) {
    }
    @IBAction func commentButton(sender: AnyObject) {
    }
}
