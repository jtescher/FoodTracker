//
//  ViewController.swift
//  FoodTracker
//
//  Created by Julian Tescher on 12/30/15.
//  Copyright © 2015 Julian Tescher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: AnyObject) {
        mealNameLabel.text = "Default Text"
    }

}
