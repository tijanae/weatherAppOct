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
    var detailedView = DetailedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailedView)
        view.backgroundColor = .white
        setUI()

        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        detailedView.sunriseLabel.text = "Sunrise: \(detailedDay.todaySunrise)"
        detailedView.sunsetLabel.text = "Sunset: \(detailedDay.tonightSunset)"
        detailedView.weatherTempHi.text = "High: \(detailedDay.temperatureHigh)"
        detailedView.weatherTempLow.text = "Low: \(detailedDay.temperatureLow)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
