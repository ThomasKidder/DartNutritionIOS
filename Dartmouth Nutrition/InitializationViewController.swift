//
//  InitializationViewController.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/11/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import UIKit

class InitializationViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
    }

    
}
