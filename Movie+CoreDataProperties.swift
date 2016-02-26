//
//  Movie+CoreDataProperties.swift
//  TopMovies
//
//  Created by ron avot on 26.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var url: String?

}
