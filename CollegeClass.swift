//
//  CollegeClass.swift
//  CollegeProfileBuilder
//
//  Created by GBernero on 2/9/17.
//  Copyright © 2017 GBernero. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = ""
    var image = UIImage(named: "default")
    
    init(Name:String, Location:String, NumberOfStudents:String, Image:UIImage)
    {
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
    }
    
    init(Name:String, Location:String)
    {
        name = Name
        location = Location
    }
    
}
