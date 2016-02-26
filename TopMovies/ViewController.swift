//
//  ViewController.swift
//  TopMovies
//
//  Created by ron avot on 25.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import UIKit
import CoreData
import WebKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    //IBOuetlet
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //view did appear
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    //Functions
    ///table view functions
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("movieCell") as? movieCell{
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        }else{
            return movieCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
   
    ///core data functions
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        }catch let err as NSError{
            print(err.debugDescription)
            }
        }
    
    
    
    //MARK:- Navigatoin
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "showDetail" {
            let svc = segue.destinationViewController as! showDetailVC
            
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
            
            svc.movie = movies[indexPath.row]
        }
    }
    @IBAction func loadUrl(sender: AnyObject) {
        if let url = NSURL(string: "https://www.imdb.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    

    }

    
    
    
    
    
    
 




