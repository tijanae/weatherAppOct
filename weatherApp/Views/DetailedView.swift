//
//  DetailedView.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/14/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class DetailedView: UIView {

    lazy var thisCityName: UILabel = {
        let name = UILabel()
        return name
    }()
    
    lazy var thisCity: UIImageView = {
        let cityImage = UIImageView()
        return cityImage
    }()
    
    lazy var sunriseLabel: UILabel = {
       let dayLabel = UILabel()
        dayLabel.textColor = .orange
        return dayLabel
    }()
    
    lazy var sunsetLabel: UILabel = {
        let nightLabel = UILabel()
        nightLabel.textColor = .red
        return nightLabel
    }()
    
    lazy var weatherTempHi: UILabel = {
        let tempHi = UILabel()
        tempHi.textColor = .purple
        return tempHi
    }()
    
    lazy var weatherTempLow: UILabel = {
        let tempLo = UILabel()
        tempLo.textColor = .blue
        return tempLo
    }()
    
    lazy var weatherWind: UILabel = {
        let wind = UILabel()
        wind.textColor = .blue
        return wind
    }()
    
    lazy var precipitation: UILabel = {
        let rainDrops = UILabel()
        rainDrops.textColor = .blue
        return rainDrops
    }()
    
    
    
//    temp hi
//    temp low
//    windspeed
//    precipitation
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubviews()
        constrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(sunriseLabel)
        addSubview(sunsetLabel)
        addSubview(weatherTempHi)
        addSubview(weatherTempLow)
        addSubview(weatherWind)
        addSubview(precipitation)
        addSubview(thisCity)
        addSubview(thisCityName)
    }
    
    func constrains() {
        
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        [sunriseLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), sunriseLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true }

        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        [sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor), sunsetLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true }

        weatherTempHi.translatesAutoresizingMaskIntoConstraints = false
        [weatherTempHi.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor), weatherTempHi.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true}

        weatherTempLow.translatesAutoresizingMaskIntoConstraints = false
        [weatherTempLow.topAnchor.constraint(equalTo: weatherTempHi.bottomAnchor), weatherTempLow.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true}

        weatherWind.translatesAutoresizingMaskIntoConstraints = false
        [weatherWind.topAnchor.constraint(equalTo: weatherTempLow.bottomAnchor), weatherWind.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true}

        precipitation.translatesAutoresizingMaskIntoConstraints = false
        [precipitation.topAnchor.constraint(equalTo: weatherWind.bottomAnchor), precipitation.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true}

        thisCity.translatesAutoresizingMaskIntoConstraints = false
        [thisCity.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor), thisCity.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach { $0.isActive = true }
        
        thisCity.translatesAutoresizingMaskIntoConstraints = false
        [thisCity.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50), thisCity.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -50), thisCity.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50), thisCity.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50)].forEach{ $0.isActive = true }
        
        thisCityName.translatesAutoresizingMaskIntoConstraints = false
        [thisCityName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10), thisCityName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true}
            
        
        
    }
    
    
    
    
}
