//
//  ImagePersistence.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/15/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

struct CityImagePersistenceManager {
    
    private init() {}
    static let manager = CityImagePersistenceManager()
    
    private let persistenceHelper = PersistenceHelper<PhotoWrapper>(fileName: "cityImages.plist")
    
    func savePhoto(photo: PhotoWrapper) throws {
        try persistenceHelper.save(newElement: photo)
    }
    
    func getPhoto() throws -> [PhotoWrapper] {
        return try persistenceHelper.getObjects()
    }
}
