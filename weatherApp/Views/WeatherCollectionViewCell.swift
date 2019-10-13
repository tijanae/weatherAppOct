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
    
    
    func configureCell(weather: Weather) {
        tempHi.text = "High: \(weather.temperatureHigh)"
        tempLow.text = "Low: \(weather.temperatureLow)"
        
    }
}
