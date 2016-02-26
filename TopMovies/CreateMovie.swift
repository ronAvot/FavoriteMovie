//
//  CreateMovie.swift
//  TopMovies
//
//  Created by ron avot on 26.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import UIKit
import CoreData
class CreateMovie: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //@IBOutlets
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc:UITextField!
    @IBOutlet weak var movieURL:UITextField!
    @IBOutlet weak var movieImg:UIImageView!
    @IBOutlet weak var addMovieBtn:UIButton!
    
    //variables
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker=UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 7.0
        movieImg.clipsToBounds = true

    }
    
    //functions
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    //@IBactions
    @IBAction func addImage(sender:AnyObject!){
        addMovieBtn.hidden = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createMovie(sender:AnyObject!){
        if let title = movieTitle.text where title != ""{
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = movieTitle.text
            movie.desc = movieDesc.text
            movie.url = movieURL.text
            movie.setMovieImage(movieImg.image!)
            context.insertObject(movie)
            
            do{
                try context.save()
            }catch{
                print("could not save movie")
            }
            }
        self.navigationController?.popToRootViewControllerAnimated(true)
            
        }
        
   




}
