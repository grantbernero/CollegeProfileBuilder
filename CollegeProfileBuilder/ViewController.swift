//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by GBernero on 2/8/17.
//  Copyright © 2017 GBernero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "Georgetown University", Location: "Washington, D.C.", NumberOfStudents: "7,500", Image:UIImage(named: "georgetownimage")!))
        myCollegeObject.append(CollegeClass(Name: "Yale University", Location: "New Haven, CT", NumberOfStudents: "5,500", Image:UIImage(named: "yaleimage")!))
        myCollegeObject.append(CollegeClass(Name: "Harvard University", Location: "Boston, MA", NumberOfStudents: "6,700", Image:UIImage(named: "harvardimage")!))
    }
    //add to list of colleges
    @IBAction func addButtonTap(_ sender: UIBarButtonItem)
    {
        //STOPPED HERE NEED TO FIX CODE BELOW
        let alert = UIAlertController(title: "Add College:", message: "", preferredStyle: .alert)
        alert.addTextField { (movieTextField) in
            movieTextField.placeholder = "Add College Here"
        }
        
        alert.addTextField { (yearTextField) in
            yearTextField.placeholder = "Add Year Here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let movieTextField = alert.textFields?[0]
            let yearTextField = alert.textFields?[1]
            
            self.myMovieObject.append(MovieClass(Title: (movieTextField?.text!)!, Year: (yearTextField?.text!)!))
            
            self.myTableView.reloadData()
            
        }
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //Required function! Sets the # of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myMovieObject.count
    }
    
    //Required function! Sets the info in cells in tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //sets cell identifier to one on storyboard!
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = myMovieObject[indexPath.row].title
        
        cell.detailTextLabel?.text = myMovieObject[indexPath.row].year
        return cell
    }
    
    //allows you to delete rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            myMovieObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }

}

