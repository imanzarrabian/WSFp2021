//
//  ViewController.swift
//  ColorChangingApp
//
//  Created by Iman Zarrabian on 26/09/2018.
//  Copyright © 2018 One More Thing Studio. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {

    @IBOutlet weak var paletteHeight: NSLayoutConstraint!
    //Get a reference to the view
    @IBOutlet weak var colorChangingView: UIView!
    @IBOutlet weak var mainButton: UIButton!

    //declare an array of colors
    let colorsArray =  [UIColor.red, UIColor.blue, UIColor.black, UIColor.purple, UIColor.yellow, UIColor.green, UIColor.gray]

    var nextSelectedColor: UIColor!
    override func viewDidLoad() {
        paletteHeight.constant = 0.0
        super.viewDidLoad()
        announceNextColor()
    }

    @IBAction func paletteColorTapped(_ sender: UIButton) {
        colorChangingView.backgroundColor = sender.backgroundColor
    }
    @IBAction func touched(_ sender: Any) {
        //Change the color of that reference
        colorChangingView.backgroundColor = nextSelectedColor
        announceNextColor()
    }

    @IBAction func displayPalette(_ sender: Any) {
        let newHeight = paletteHeight.constant == 44.0 ? 0.0 : 44.0

        paletteHeight.constant = CGFloat(newHeight)
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    func getRandomColor() -> UIColor {
        //Get a random color
        //calculate a random number in the range of the array
        let randomNumber = Int(arc4random()) % colorsArray.count

        //obtain the color at that index
        let selectedColor = colorsArray[randomNumber]
        return selectedColor
    }

    func announceNextColor() {
        nextSelectedColor = getRandomColor()
        mainButton.tintColor = nextSelectedColor
    }

    @IBAction func nextLevelTouched(_ sender: UIButton) {
        print("next level")
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //trouver le background color de colorChangingView (la couleur actuellement affichée)
        let selectedC = colorChangingView.backgroundColor

        //trouver une reference vers le VC d'arrivée
        if let detailVC = segue.destination as? DetailViewController {
            //lui donner cette couleur
            detailVC.selectedColor = selectedC
        }
    }
}

