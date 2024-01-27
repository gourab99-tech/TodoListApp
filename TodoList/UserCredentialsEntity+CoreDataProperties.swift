//
//  UserCredentialsEntity+CoreDataProperties.swift
//  TodoList
//
//  Created by Singh, Balwant on 27/01/24.
//
//

import Foundation
import CoreData


extension UserCredentialsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCredentialsEntity> {
        return NSFetchRequest<UserCredentialsEntity>(entityName: "UserCredentialsEntity")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension UserCredentialsEntity : Identifiable {

}
