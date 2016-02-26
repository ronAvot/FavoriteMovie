//
//  Movie.swift
//  TopMovies
//
//  Created by ron avot on 26.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Movie)
class Movie: NSManagedObject {
    
    //Functions
    ///set image object
    func setMovieImage(img:UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    ///get image object
    func getMovieImage()->UIImage{
        let img = UIImage(data: self.image!)!
        return img
    }
}
