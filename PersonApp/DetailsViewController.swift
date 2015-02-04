//
//  DetailsViewController.swift
//  PersonApp
//
//  Created by Zachary Friss on 2/3/15.
//  Copyright (c) 2015 Zachary Friss. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var person: Person?
    
    @IBOutlet weak var albumCover: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var jobTitle: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "\(self.person!.firstName) \(self.person!.lastName)"
        jobTitle.text = "\(self.person!.jobTitle), \(self.person!.companyName)"
        albumCover.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://www.gravatar.com/avatar/\(self.person!.email.MD5())")!)!)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
    }
}
