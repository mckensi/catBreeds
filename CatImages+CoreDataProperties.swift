//
//  CatImages+CoreDataProperties.swift
//  
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//
//

import Foundation
import CoreData


extension CatImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatImages> {
        return NSFetchRequest<CatImages>(entityName: "CatImages")
    }

    @NSManaged public var id: String?
    @NSManaged public var urlImage: String?
    @NSManaged public var voteLike: Bool

}
