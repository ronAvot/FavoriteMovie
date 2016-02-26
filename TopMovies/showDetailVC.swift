//
//  showDetailVC.swift
//  TopMovies
//
//  Created by ron avot on 26.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import UIKit

class showDetailVC: UIViewController {
    
    //Model
    var movie:Movie?
    //@IBOutlet
    @IBOutlet weak var movieImg:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descLbl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = movie?.title
        descLbl.text = movie?.desc
        movieImg.image = movie?.getMovieImage()
        
        
    }


    

  
}
