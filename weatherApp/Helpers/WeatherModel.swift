//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

struct WeatherResult: Codable {
    let daily: WeatherWrapper
}

struct WeatherWrapper: Codable {
    let data: [Weather]
}

struct Weather: Codable {
    let time: Double
    let icon: String
    let sunriseTime: Double
    let sunsetTime: Double
    let precipProbability: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    var dated: String {
        let weatherDate = NSDate(timeIntervalSince1970: time) as Date
        let thisDate = DateFormatter()
        thisDate.dateFormat = "MMM-dd-yyyy"
        return thisDate.string(from: weatherDate)
    }
    var todaySunrise: String {
        let weatherSunrise = NSDate(timeIntervalSince1970: sunriseTime) as Date
        let thisSunrise = DateFormatter()
        thisSunrise.dateFormat = "HH:MM a"
        thisSunrise.amSymbol = "AM"
        thisSunrise.pmSymbol = "PM"
        return thisSunrise.string(from: weatherSunrise)
    }
    var tonightSunset: String {
        let weatherSunset = NSDate(timeIntervalSince1970: sunsetTime) as Date
        let thisSunset = DateFormatter()
        thisSunset.dateFormat = "HH:MM a"
        thisSunset.amSymbol = "AM"
        thisSunset.pmSymbol = "PM"
        return thisSunset.string(from: weatherSunset)
    }
    
}

/*
 https://api.darksky.net/forecast/[key]/[latitude],[longitude]

 {
     "latitude": 42.3601,
     "longitude": -71.0589,
     "timezone": "America/New_York",
     "currently": {
         "time": 1570649768,
         "summary": "Overcast",
         "icon": "cloudy",
         "nearestStormDistance": 5,
         "nearestStormBearing": 187,
         "precipIntensity": 0,
         "precipProbability": 0,
         "temperature": 55.45,
         "apparentTemperature": 55.45,
         "dewPoint": 46.43,
         "humidity": 0.72,
         "pressure": 1026.66,
         "windSpeed": 10.33,
         "windGust": 14.06,
         "windBearing": 32,
         "cloudCover": 1,
         "uvIndex": 1,
         "visibility": 9.854,
         "ozone": 274.1
     },
     "daily": {
         "summary": "Rain throughout the week, with high temperatures rising to 69°F on Sunday.",
         "icon": "rain",
         "data": [
             {
                 "time": 1570593600,
                 "summary": "Light rain until morning, starting again in the evening.",
                 "icon": "rain",
                 "sunriseTime": 1570618276,
                 "sunsetTime": 1570659240,
                 "moonPhase": 0.38,
                 "precipIntensity": 0.0088,
                 "precipIntensityMax": 0.0407,
                 "precipIntensityMaxTime": 1570676400,
                 "precipProbability": 0.92,
                 "precipType": "rain",
                 "temperatureHigh": 58.24,
                 "temperatureHighTime": 1570626000,
                 "temperatureLow": 53.46,
                 "temperatureLowTime": 1570701600,
                 "apparentTemperatureHigh": 57.57,
                 "apparentTemperatureHighTime": 1570626000,
                 "apparentTemperatureLow": 54.11,
                 "apparentTemperatureLowTime": 1570701600,
                 "dewPoint": 47.48,
                 "humidity": 0.74,
                 "pressure": 1026.31,
                 "windSpeed": 12.13,
                 "windGust": 33.22,
                 "windGustTime": 1570676400,
                 "windBearing": 35,
                 "cloudCover": 0.54,
                 "uvIndex": 4,
                 "uvIndexTime": 1570636800,
                 "visibility": 9.664,
                 "ozone": 276.1,
                 "temperatureMin": 52.88,
                 "temperatureMinTime": 1570604400,
                 "temperatureMax": 58.24,
                 "temperatureMaxTime": 1570626000,
                 "apparentTemperatureMin": 53.53,
                 "apparentTemperatureMinTime": 1570604400,
                 "apparentTemperatureMax": 57.57,
                 "apparentTemperatureMaxTime": 1570626000
             },
             {
                 "time": 1570680000,
                 "summary": "Rain and windy throughout the day.",
                 "icon": "rain",
                 "sunriseTime": 1570704744,
                 "sunsetTime": 1570745539,
                 "moonPhase": 0.41,
                 "precipIntensity": 0.0918,
                 "precipIntensityMax": 0.1724,
                 "precipIntensityMaxTime": 1570726800,
                 "precipProbability": 1,
                 "precipType": "rain",
                 "temperatureHigh": 55.82,
                 "temperatureHighTime": 1570705200,
                 "temperatureLow": 53.8,
                 "temperatureLowTime": 1570748400,
                 "apparentTemperatureHigh": 55.15,
                 "apparentTemperatureHighTime": 1570705200,
                 "apparentTemperatureLow": 54.45,
                 "apparentTemperatureLowTime": 1570748400,
                 "dewPoint": 47.75,
                 "humidity": 0.79,
                 "pressure": 1023.75,
                 "windSpeed": 21.22,
                 "windGust": 40.34,
                 "windGustTime": 1570716000,
                 "windBearing": 34,
                 "cloudCover": 0.99,
                 "uvIndex": 3,
                 "uvIndexTime": 1570726800,
                 "visibility": 5.942,
                 "ozone": 274.9,
                 "temperatureMin": 52.09,
                 "temperatureMinTime": 1570723200,
                 "temperatureMax": 55.82,
                 "temperatureMaxTime": 1570705200,
                 "apparentTemperatureMin": 52.74,
                 "apparentTemperatureMinTime": 1570723200,
                 "apparentTemperatureMax": 55.15,
                 "apparentTemperatureMaxTime": 1570705200
             },
             {
                 "time": 1570766400,
                 "summary": "Rain throughout the day.",
                 "icon": "rain",
                 "sunriseTime": 1570791212,
                 "sunsetTime": 1570831839,
                 "moonPhase": 0.44,
                 "precipIntensity": 0.0769,
                 "precipIntensityMax": 0.1,
                 "precipIntensityMaxTime": 1570806000,
                 "precipProbability": 0.99,
                 "precipType": "rain",
                 "temperatureHigh": 57.77,
                 "temperatureHighTime": 1570795200,
                 "temperatureLow": 55.47,
                 "temperatureLowTime": 1570838400,
                 "apparentTemperatureHigh": 57.1,
                 "apparentTemperatureHighTime": 1570795200,
                 "apparentTemperatureLow": 56.12,
                 "apparentTemperatureLowTime": 1570838400,
                 "dewPoint": 49.2,
                 "humidity": 0.78,
                 "pressure": 1020.73,
                 "windSpeed": 20.62,
                 "windGust": 36.81,
                 "windGustTime": 1570784400,
                 "windBearing": 44,
                 "cloudCover": 1,
                 "uvIndex": 3,
                 "uvIndexTime": 1570813200,
                 "visibility": 8.164,
                 "ozone": 278.3,
                 "temperatureMin": 53.93,
                 "temperatureMinTime": 1570773600,
                 "temperatureMax": 57.9,
                 "temperatureMaxTime": 1570852800,
                 "apparentTemperatureMin": 54.58,
                 "apparentTemperatureMinTime": 1570773600,
                 "apparentTemperatureMax": 57.23,
                 "apparentTemperatureMaxTime": 1570852800
             },
             {
                 "time": 1570852800,
                 "summary": "Light rain in the morning.",
                 "icon": "rain",
                 "sunriseTime": 1570877680,
                 "sunsetTime": 1570918140,
                 "moonPhase": 0.47,
                 "precipIntensity": 0.0207,
                 "precipIntensityMax": 0.0814,
                 "precipIntensityMaxTime": 1570860000,
                 "precipProbability": 0.91,
                 "precipType": "rain",
                 "temperatureHigh": 58.04,
                 "temperatureHighTime": 1570881600,
                 "temperatureLow": 49.27,
                 "temperatureLowTime": 1570960800,
                 "apparentTemperatureHigh": 57.37,
                 "apparentTemperatureHighTime": 1570881600,
                 "apparentTemperatureLow": 49.31,
                 "apparentTemperatureLowTime": 1570960800,
                 "dewPoint": 48.21,
                 "humidity": 0.75,
                 "pressure": 1014.82,
                 "windSpeed": 12.67,
                 "windGust": 32.46,
                 "windGustTime": 1570852800,
                 "windBearing": 21,
                 "cloudCover": 0.99,
                 "uvIndex": 3,
                 "uvIndexTime": 1570899600,
                 "visibility": 9.946,
                 "ozone": 270.8,
                 "temperatureMin": 54.47,
                 "temperatureMinTime": 1570899600,
                 "temperatureMax": 58.04,
                 "temperatureMaxTime": 1570881600,
                 "apparentTemperatureMin": 55.12,
                 "apparentTemperatureMinTime": 1570899600,
                 "apparentTemperatureMax": 57.37,
                 "apparentTemperatureMaxTime": 1570881600
             },
             {
                 "time": 1570939200,
                 "summary": "Mostly cloudy throughout the day.",
                 "icon": "partly-cloudy-day",
                 "sunriseTime": 1570964149,
                 "sunsetTime": 1571004442,
                 "moonPhase": 0.51,
                 "precipIntensity": 0.0001,
                 "precipIntensityMax": 0.0003,
                 "precipIntensityMaxTime": 1570978800,
                 "precipProbability": 0.07,
                 "precipType": "rain",
                 "temperatureHigh": 69.6,
                 "temperatureHighTime": 1570993200,
                 "temperatureLow": 45.85,
                 "temperatureLowTime": 1571050800,
                 "apparentTemperatureHigh": 68.93,
                 "apparentTemperatureHighTime": 1570993200,
                 "apparentTemperatureLow": 45.22,
                 "apparentTemperatureLowTime": 1571050800,
                 "dewPoint": 45.08,
                 "humidity": 0.62,
                 "pressure": 1015.42,
                 "windSpeed": 4.94,
                 "windGust": 12.15,
                 "windGustTime": 1571011200,
                 "windBearing": 274,
                 "cloudCover": 0.69,
                 "uvIndex": 4,
                 "uvIndexTime": 1570986000,
                 "visibility": 10,
                 "ozone": 272.9,
                 "temperatureMin": 49.27,
                 "temperatureMinTime": 1570960800,
                 "temperatureMax": 69.6,
                 "temperatureMaxTime": 1570993200,
                 "apparentTemperatureMin": 49.31,
                 "apparentTemperatureMinTime": 1570960800,
                 "apparentTemperatureMax": 68.93,
                 "apparentTemperatureMaxTime": 1570993200
             },
             {
                 "time": 1571025600,
                 "summary": "Mostly cloudy throughout the day.",
                 "icon": "partly-cloudy-day",
                 "sunriseTime": 1571050618,
                 "sunsetTime": 1571090744,
                 "moonPhase": 0.54,
                 "precipIntensity": 0.0001,
                 "precipIntensityMax": 0.0003,
                 "precipIntensityMaxTime": 1571097600,
                 "precipProbability": 0.04,
                 "precipType": "rain",
                 "temperatureHigh": 66.81,
                 "temperatureHighTime": 1571076000,
                 "temperatureLow": 50.25,
                 "temperatureLowTime": 1571133600,
                 "apparentTemperatureHigh": 66.14,
                 "apparentTemperatureHighTime": 1571076000,
                 "apparentTemperatureLow": 50.9,
                 "apparentTemperatureLowTime": 1571133600,
                 "dewPoint": 38.58,
                 "humidity": 0.52,
                 "pressure": 1017.16,
                 "windSpeed": 4.32,
                 "windGust": 10.58,
                 "windGustTime": 1571112000,
                 "windBearing": 187,
                 "cloudCover": 0.56,
                 "uvIndex": 4,
                 "uvIndexTime": 1571072400,
                 "visibility": 10,
                 "ozone": 282.7,
                 "temperatureMin": 45.85,
                 "temperatureMinTime": 1571050800,
                 "temperatureMax": 66.81,
                 "temperatureMaxTime": 1571076000,
                 "apparentTemperatureMin": 45.22,
                 "apparentTemperatureMinTime": 1571050800,
                 "apparentTemperatureMax": 66.14,
                 "apparentTemperatureMaxTime": 1571076000
             },
             {
                 "time": 1571112000,
                 "summary": "Mostly cloudy throughout the day.",
                 "icon": "partly-cloudy-day",
                 "sunriseTime": 1571137087,
                 "sunsetTime": 1571177047,
                 "moonPhase": 0.57,
                 "precipIntensity": 0.0001,
                 "precipIntensityMax": 0.0004,
                 "precipIntensityMaxTime": 1571162400,
                 "precipProbability": 0.03,
                 "precipType": "rain",
                 "temperatureHigh": 67.25,
                 "temperatureHighTime": 1571169600,
                 "temperatureLow": 52.64,
                 "temperatureLowTime": 1571209200,
                 "apparentTemperatureHigh": 66.58,
                 "apparentTemperatureHighTime": 1571169600,
                 "apparentTemperatureLow": 53.29,
                 "apparentTemperatureLowTime": 1571209200,
                 "dewPoint": 41.67,
                 "humidity": 0.56,
                 "pressure": 1014.82,
                 "windSpeed": 4.6,
                 "windGust": 17.8,
                 "windGustTime": 1571187600,
                 "windBearing": 239,
                 "cloudCover": 0.53,
                 "uvIndex": 3,
                 "uvIndexTime": 1571155200,
                 "visibility": 10,
                 "ozone": 294.6,
                 "temperatureMin": 50.25,
                 "temperatureMinTime": 1571133600,
                 "temperatureMax": 67.25,
                 "temperatureMaxTime": 1571169600,
                 "apparentTemperatureMin": 50.9,
                 "apparentTemperatureMinTime": 1571133600,
                 "apparentTemperatureMax": 66.58,
                 "apparentTemperatureMaxTime": 1571169600
             },
             {
                 "time": 1571198400,
                 "summary": "Light rain until evening.",
                 "icon": "rain",
                 "sunriseTime": 1571223557,
                 "sunsetTime": 1571263351,
                 "moonPhase": 0.6,
                 "precipIntensity": 0.0196,
                 "precipIntensityMax": 0.0549,
                 "precipIntensityMaxTime": 1571248800,
                 "precipProbability": 0.99,
                 "precipType": "rain",
                 "temperatureHigh": 59.28,
                 "temperatureHighTime": 1571234400,
                 "temperatureLow": 46.65,
                 "temperatureLowTime": 1571310000,
                 "apparentTemperatureHigh": 58.61,
                 "apparentTemperatureHighTime": 1571234400,
                 "apparentTemperatureLow": 43.13,
                 "apparentTemperatureLowTime": 1571310000,
                 "dewPoint": 43.24,
                 "humidity": 0.67,
                 "pressure": 1008.22,
                 "windSpeed": 6.69,
                 "windGust": 18.3,
                 "windGustTime": 1571252400,
                 "windBearing": 11,
                 "cloudCover": 0.84,
                 "uvIndex": 3,
                 "uvIndexTime": 1571245200,
                 "visibility": 8.255,
                 "ozone": 315,
                 "temperatureMin": 50.84,
                 "temperatureMinTime": 1571284800,
                 "temperatureMax": 59.28,
                 "temperatureMaxTime": 1571234400,
                 "apparentTemperatureMin": 51.49,
                 "apparentTemperatureMinTime": 1571284800,
                 "apparentTemperatureMax": 58.61,
                 "apparentTemperatureMaxTime": 1571234400
             }
         ]
     },
     "flags": {
         "sources": [
             "nwspa",
             "cmc",
             "gfs",
             "hrrr",
             "icon",
             "isd",
             "madis",
             "nam",
             "sref",
             "darksky",
             "nearest-precip"
         ],
         "nearest-station": 0.462,
         "units": "us"
     },
     "offset": -4
 }
 */
