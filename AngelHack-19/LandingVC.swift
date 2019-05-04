//
//  LandingVC.swift
//  AngelHack-19
//
//  Created by Tushar Singh on 04/05/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {


    @IBOutlet weak var feedTableView: UITableView!
    var cellHeight = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        let nib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        feedTableView.register(nib, forCellReuseIdentifier: "cell")
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        feedTableView.separatorStyle =  .none
//        feedTableView.bounces = false
        
        
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
                performSegue(withIdentifier: "2", sender: nil)
                break;
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
                break;
            default:
                break
            }
        }
    }
    
}

extension LandingVC:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cellHeight = cell.contentView.layer.frame.height
        cell.isUserInteractionEnabled = true
        cell.contentView.roundCorners([.bottomLeft,.bottomRight], radius: 5)
        cell.contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.contentView.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.layer.shadowRadius = 4
        cell.contentView.layer.shadowOpacity = 0.25
        cell.contentView.layer.masksToBounds = false;
        cell.contentView.clipsToBounds = false;
        cell.selectionStyle = .none
        //cellHeight = cell.bgView.layer.frame.height
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row,"sdbahjiusdh")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 183
    }
    
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
