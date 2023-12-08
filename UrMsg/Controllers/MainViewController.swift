//
//  MainViewController.swift
//  UrMsg
//
//  Created by AyanMao on 12/8/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the view's properties
        view.backgroundColor = .white // Set the background color or any other properties

        // Add subviews and set up constraints or frames
        // For example, to add a label:
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.text = "Main View Controller"
        view.addSubview(label)
        // ... Add other UI setup code here ...
    }
}
