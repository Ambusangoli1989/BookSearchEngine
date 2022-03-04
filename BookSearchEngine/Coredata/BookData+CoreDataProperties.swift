//
//  Photo+CoreDataProperties.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

import Foundation
import CoreData


extension BookData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookData> {
        return NSFetchRequest<BookData>(entityName: "BookData");
    }

    @NSManaged public var authorname: String?
    @NSManaged public var title: String?
    @NSManaged public var publishyear: String?
    @NSManaged public var coveri: String?
    @NSManaged public var key: String?
}
