//
//  CityImageModel.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/16/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

struct SavedCityImage: Codable {
    let imageName: String
    let imageData: Data
}
