//
//  DayDetailViewController.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class DayDetailViewController: UIViewController {
    
    var detailedDay: Weather!
    
    var cityName: String!
    
    var detailedView = DetailedView()
    
    var thisCityImage = [Photo]() {
        didSet {
           
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailedView)
        view.backgroundColor = .white
        loadImage()
        setUI()
        
        
        

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        loadData(cityImage: cityName)
//    }
    
    func setUI() {
        detailedView.sunriseLabel.text = "Sunrise: \(detailedDay.todaySunrise)"
        detailedView.sunsetLabel.text = "Sunset: \(detailedDay.tonightSunset)"
        detailedView.weatherTempHi.text = "High: \(detailedDay.temperatureHigh)"
        detailedView.weatherTempLow.text = "Low: \(detailedDay.temperatureLow)"
        detailedView.weatherWind.text = "Wind: \(detailedDay.windSpeed)mph"
        detailedView.precipitation.text = "Precipitation Percentage: \(detailedDay.precipProbability * 100)%"
//        detailedView.thisCity.image = UIImage(named: "icons8-fog_night")
        detailedView.thisCityName.text = "\(cityName!)"
    }

    
//    private func loadImage() {
//        PhotoApiHelper.shared.getCityImage(name: cityName) { (result) in
//            DispatchQueue.main.async {
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let cityImageFromOnline):
//                    self.thisCityImage = cityImageFromOnline
//                    print(self.thisCityImage)
//
//                }
//            }
//        }
//    }
    
    private func loadImage() {
        PhotoApiHelper.shared.getCityImage(name: cityName) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.detailedView.thisCity.image = UIImage(named: "icons8-fog_night")
                    print(error)
                case .success(let cityImageFromOnline):
                    self.thisCityImage = cityImageFromOnline
                    
                    ImageHelper.shared.getImage(urlStr: self.thisCityImage[0].largeImageURL) { (result) in
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let imageData):
                            DispatchQueue.main.async {
                                self.detailedView.thisCity.image = imageData
                            }
                        }
                    }

                }
            }
        }
    }


    
    
//    private func getCityImage(cityImage: UIImage) {
//        PhotoApiHelper.shared.getCityImage(name: <#T##String#>) { (<#Result<[Photo], AppError>#>) in
//            <#code#>
//        }
////        WeatherAPIHelper.shared.getWeather(lat: latitude, long: longitude) { (result) in
////            DispatchQueue.main.async {
////                switch result {
////                case .failure(let error):
////                    print(error)
////                case .success(let weatherDataFromOnline):
////                    self.weatherData = weatherDataFromOnline
////                }
////            }
////        }
//    }
    


}
