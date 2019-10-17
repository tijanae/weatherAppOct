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
    
    private let persistenceHelper = PersistenceHelper<SavedCityImage>(fileName: "cityImages.plist")
    
    func savePhoto(photo: SavedCityImage) throws {
        try persistenceHelper.save(newElement: photo)
    }
    
    func getPhoto() throws -> [SavedCityImage] {
        return try persistenceHelper.getObjects()
    }
}
