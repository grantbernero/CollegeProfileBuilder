//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by GBernero on 2/9/17.
//  Copyright © 2017 GBernero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var collegeNameTextField: UITextField!
    
    @IBOutlet weak var collegeLocationTextField: UITextField!
    
    @IBOutlet weak var collegeNumberOfStudentsTextField: UITextField!
    
    @IBOutlet weak var collegeWebsiteTextField: UITextField!
    
    var collegeDetail:CollegeClass!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.image = collegeDetail.image
        collegeNameTextField.text = collegeDetail.name
        collegeLocationTextField.text = collegeDetail.location
        collegeNumberOfStudentsTextField.text = collegeDetail.numberOfStudents
        collegeWebsiteTextField.text = collegeDetail.website
        imagePicker.delegate = self
    }
    
    @IBAction func saveButtonIsTapped(_ sender: Any)
    {
        
        collegeDetail.name = collegeNameTextField.text!
        
        collegeDetail.location = collegeLocationTextField.text!

        collegeDetail.numberOfStudents = collegeNumberOfStudentsTextField.text!
        
        collegeDetail.website = collegeWebsiteTextField.text!
    }
    
    @IBAction func goToWebsite(_ sender: Any)
    {
        if let url = URL(string: collegeWebsiteTextField.text!)
        {
            UIApplication.shared.openURL(url)
        }
       
    }
    
    @IBAction func loadImage(_ sender: Any)
    {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.contentMode = .scaleAspectFit
        imageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }

}
