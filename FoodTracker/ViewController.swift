//
//  ViewController.swift
//  FoodTracker
//
//  Created by Julian Tescher on 12/30/15.
//  Copyright © 2015 Julian Tescher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!


    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field's user input through delegate callbacks.
        mealNameTextField.delegate = self
    }


    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        // Hide the keyboard.
        textField.resignFirstResponder()

        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }


    // MARK: Actions

    @IBAction func setDefaultLabelText(sender: AnyObject) {
        mealNameLabel.text = "Default Text"
    }

}
