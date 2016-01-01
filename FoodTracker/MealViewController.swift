//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Julian Tescher on 12/30/15.
//  Copyright © 2015 Julian Tescher. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    // MARK: Properties
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!


    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        mealNameTextField.delegate = self
    }


    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        // Hide the keyboard.
        textField.resignFirstResponder()

        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {

    }


    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }


    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {

        // Hide the keyboard.
        mealNameTextField.resignFirstResponder()

        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary // Only allow photos to be picked, not taken.
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

}
