//
//  DetailViewController.swift
//  ColorChangingApp
//
//  Created by Iman Zarrabian on 16/10/2018.
//  Copyright © 2018 One More Thing Studio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedColor: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = selectedColor
    }
}
