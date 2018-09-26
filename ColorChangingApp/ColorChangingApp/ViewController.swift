//
//  ViewController.swift
//  ColorChangingApp
//
//  Created by Iman Zarrabian on 26/09/2018.
//  Copyright © 2018 One More Thing Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Get a reference to the view
    @IBOutlet weak var colorChangingView: UIView!

    //declare an array of colors
    let colorsArray =  [UIColor.red, UIColor.blue, UIColor.black, UIColor.purple, UIColor.yellow, UIColor.green, UIColor.gray]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touched(_ sender: Any) {

        //Get a random color
        //calculate a random number in the range of the array
        let randomNumber = Int(arc4random()) % colorsArray.count

        //obtain the color at that index
        let selectedColor = colorsArray[randomNumber]

        //Change the color of that reference
        colorChangingView.backgroundColor = selectedColor
    }
}

