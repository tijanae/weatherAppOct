//
//  WeatherCollectionViewCell.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var tempHi: UILabel!
    
    @IBOutlet weak var tempLow: UILabel!
    
    let dated = DateFormatter()
    
    func configureCell(weather: Weather) {
        date.text = weather.dated.description
        tempHi.text = "High: \(weather.temperatureHigh)"
        tempLow.text = "Low: \(weather.temperatureLow)"
        weatherImage.image = getWeatherImage(weatherData: weather)
        
    }
    
    func getWeatherImage (weatherData: Weather) -> UIImage {
        let weatherImage = weatherData.icon.description
       
        switch weatherImage {
        case "partly-cloudy-day":
            return UIImage(named: "icons8-partly_cloudy_day")!
        case "clear-day":
            return UIImage(named: "icons8-sun")!
        case "rain":
            return UIImage(named: "icons8-rain")!
        case "cloudy":
            return UIImage(named: "icons8-clouds")!
        default:
            return UIImage(named: "icons8-fog_night")!
        }
    }
    
    
}
