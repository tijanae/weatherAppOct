//
//  ViewController.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var zipTextOutlet: UITextField!
    @IBAction func zipTextField(_ sender: UITextField) {
        
    }
    
    var weatherData = [Weather]() {
        didSet {
            weatherCollectionView.reloadData()
            print(weatherData)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        loadDefaults()
      
        // Do any additional setup after loading the view.
    }
    
    
    private func setUp () {
        let layout = weatherCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.scrollDirection = .horizontal
            zipTextOutlet.keyboardType = .numberPad
            zipTextOutlet.delegate = self
            weatherCollectionView.delegate = self
            weatherCollectionView.dataSource = self
            
    }
    
    
    private func loadData (zipCode: String) {
        ZipCodeHelper.getLatLong(fromZipCode: zipCode) { (result) in
            DispatchQueue.main.async {
                switch result {
                case let .failure(error):
                    print(error)
                case let .success((lat, long)):
                    UserDefaults.standard.set(lat, forKey: "latitude")
                    UserDefaults.standard.set(long, forKey: "longitude")
                    
                }
            }
        }
    }
    
    private func loadDefaults() {
        if let lat = UserDefaults.standard.value(forKey: "latitude") as? Double, let long = UserDefaults.standard.value(forKey: "longitude") as? Double {
            getData(latitude: lat, longitude: long)
        }
    }
    
    
    private func getData(latitude: Double, longitude: Double) {
        WeatherAPIHelper.shared.getWeather(lat: latitude, long: longitude) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let weatherDataFromOnline):
                    self.weatherData = weatherDataFromOnline
                }
            }
        }
    }
    
//    private func getWeatherImage (weatherData: Weather) {
//        let weatherImage = weatherData.icon.text
//        
//        switch weatherImage {
//        case "partly-cloudy-day":
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
//    func collectionLayout () {
//        let layout = weatherCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.scrollDirection = .horizontal
//        zipTextOutlet.keyboardType = .numberPad
//        zipTextOutlet.delegate = self
//    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as!
            WeatherCollectionViewCell
        let weather = weatherData[indexPath.row]
        cell.configureCell(weather: weather)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 250)
    }
    
    
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 5 {
            textField.resignFirstResponder()
            loadData(zipCode: textField.text!)
//            var zipCode = String(textField.text!)
        }
    }
}
