//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by GBernero on 2/9/17.
//  Copyright © 2017 GBernero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var collegeNameTextField: UITextField!
    
    @IBOutlet weak var collegeLocationTextField: UITextField!
    
    @IBOutlet weak var collegeNumberOfStudentsTextField: UITextField!
    
    var collegeDetail:CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.image = collegeDetail.image
        collegeNameTextField.text = collegeDetail.name
        collegeLocationTextField.text = collegeDetail.location
        collegeNumberOfStudentsTextField.text = collegeDetail.numberOfStudents
    }
}
