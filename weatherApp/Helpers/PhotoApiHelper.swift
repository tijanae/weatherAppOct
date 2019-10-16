//
//  CityAPIHelper.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

class PhotoApiHelper {
    
    private init() {}
    static let shared = PhotoApiHelper()
    
    func getCityImage(name: String, completionHandler: @escaping (Result<[Photo], AppError>) -> () ) {
        let cityImage = name.lowercased().replacingOccurrences(of: " ", with: "+")
        let urlStr = "https://pixabay.com/api/?key=\(Secrets.picApiKey)&q=\(cityImage)&image_type=photo"
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let photoInfo = try JSONDecoder().decode(PhotoWrapper.self, from: data)
                    completionHandler(.success(photoInfo.hits))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
