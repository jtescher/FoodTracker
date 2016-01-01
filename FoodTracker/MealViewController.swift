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
    @IBOutlet weak var mealSaveButton: UIBarButtonItem!

    /*
    This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
    or constructed as part of adding a new meal.
    */
    var meal: Meal?


    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let meal = meal {
            navigationItem.title = meal.name
            mealNameTextField.text   = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }

        mealNameTextField.delegate = self
        checkValidMealName()
    }


    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        // Hide the keyboard.
        textField.resignFirstResponder()

        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        mealSaveButton.enabled = false
    }
    func checkValidMealName() {
        let name = mealNameTextField.text ?? ""
        mealSaveButton.enabled = !name.isEmpty

    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = mealNameTextField.text
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

    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if mealSaveButton === sender {
            let name = mealNameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating

            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
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
