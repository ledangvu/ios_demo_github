//
//  ViewController.swift
//  HelloSwift
//
//  Created by vu on 11/29/15.
//  Copyright © 2015 dangvu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var btnSetText: UIButton!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var btnNextPage: UIButton!
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtInput.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(sender: UIButton) {
        txtInput.text = "";
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // Hide the keyboard.
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        lblMealName.text = txtInput.text;
    }

    
    @IBAction func OnImageTapped(sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        txtInput.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
  
}

