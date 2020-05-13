//
//  AddGuestDialog.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 8/23/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddGuestDialog: UIView {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var selectFaceButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
