//
//  Selfpatch1+CoreDataProperties.swift
//  UUUIII
//
//  Created by Kim minju  on 4/18/24.
//
//

import Foundation
import CoreData


extension Selfpatch1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Selfpatch1> {
        return NSFetchRequest<Selfpatch1>(entityName: "Selfpatch1")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var date: Date?
    @NSManaged public var picture: Data?
    @NSManaged public var location: String?

}

extension Selfpatch1 : Identifiable {

}
