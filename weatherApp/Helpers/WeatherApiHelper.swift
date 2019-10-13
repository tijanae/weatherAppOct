//
//  WeatherApiHelper.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

class WeatherAPIHelper {
    private init() {}
    static let shared = WeatherAPIHelper()
    
    func getWeather(lat: Double, long: Double, completionHandler: @escaping (Result<[Weather], AppError>) -> () ) {
        let urlStr = "https://api.darksky.net/forecast/\(Secrets.apiKey)/\(lat),\(long)"
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
                    let weatherInfo = try JSONDecoder().decode(WeatherResult.self, from: data)
                    completionHandler(.success(weatherInfo.daily.data))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
