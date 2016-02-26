//
//  movieCell.swift
//  TopMovies
//
//  Created by ron avot on 26.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import UIKit

class movieCell: UITableViewCell {

    //@IBOutelets
    @IBOutlet weak var movieImg:UIImageView!
    @IBOutlet weak var movieTitle:UILabel!
    @IBOutlet weak var movieDesc:UILabel!
    @IBOutlet weak var movieUrl:UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //Functions
    
    func configureCell(movie: Movie){
        movieTitle.text = movie.title
        movieDesc.text = movie.desc
        movieImg.image = movie.getMovieImage()
        
    }
    
    


}
