//
//  FileProcessing.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/11/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension (UIViewController) {
    
    func saveData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SavedData", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(myVariable.page, forKey: "page")
        
        
        do{
            try context.save()
            print("saved")
        } catch {
            print("failed saving")
        }
    }
    
    
    func getSavedData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                myVariable.page = data.value(forKey: "page") as! Int
            }
        } catch {
            print("failed to read")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
