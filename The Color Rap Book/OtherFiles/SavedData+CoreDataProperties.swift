//
//  SavedData+CoreDataProperties.swift
//  
//
//  Created by 7744 on 3/10/20.
//
//

import Foundation
import CoreData


extension SavedData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedData> {
        return NSFetchRequest<SavedData>(entityName: "SavedData")
    }

    @NSManaged public var page: Int16

}
