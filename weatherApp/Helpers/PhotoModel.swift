//
//  PhotoModel.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/14/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

struct PhotoWrapper: Codable {
   let hits: [Photo]
}

struct Photo: Codable {
   let id: Int
   let largeImageURL: String
   let userImageURL: String
}

struct FavoritePhoto: Codable {
   let date: Date
   let cityName: String
   let imageURL: String
}
