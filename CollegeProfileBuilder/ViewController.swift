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
        myCollegeObject.append(CollegeClass(Name: "Georgetown University", Location: "Washington, D.C.", NumberOfStudents: "7,500", Image:UIImage(named: "georgetownimage")!, Website: "https://www.georgetown.edu/"))
        myCollegeObject.append(CollegeClass(Name: "Yale University", Location: "New Haven, CT", NumberOfStudents: "5,500", Image:UIImage(named: "yaleimage")!, Website: "https://www.yale.edu/"))
        myCollegeObject.append(CollegeClass(Name: "Harvard University", Location: "Boston, MA", NumberOfStudents: "6,700", Image:UIImage(named: "harvardimage")!, Website: "https://www.harvard.edu"))
    }
    //add to list of colleges
    @IBAction func addButtonTap(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add College:", message: "", preferredStyle: .alert)
        alert.addTextField { (nameTextField) in
            nameTextField.placeholder = "Add College Here"
        }
        
        alert.addTextField { (locationTextField) in
            locationTextField.placeholder = "Add Location Here"
        }
        
        alert.addTextField { (websiteTextField) in
            websiteTextField.placeholder = "Add Website Here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let nameTextField = alert.textFields?[0]
            let locationTextField = alert.textFields?[1]
            let websiteTextField = alert.textFields?[2]
            
            self.myCollegeObject.append(CollegeClass(Name: (nameTextField?.text!)!, Location: (locationTextField?.text!)!, Website:(websiteTextField?.text!)!))
            
            self.tableView.reloadData()
            
        }
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //Required function! Sets the # of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    //Required function! Sets the info in cells in tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //sets cell identifier to one on storyboard!
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].location
        return cell
    }
    
    //allows you to delete rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            myCollegeObject.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        var selectedRow = tableView.indexPathForSelectedRow?.row
        detailView.collegeDetail = myCollegeObject[selectedRow!]
    }
}

