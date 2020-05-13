//
//  GuestItemTableViewCell.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 8/14/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit

class GuestItemTableViewCell: UITableViewCell {

    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var activityView: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
