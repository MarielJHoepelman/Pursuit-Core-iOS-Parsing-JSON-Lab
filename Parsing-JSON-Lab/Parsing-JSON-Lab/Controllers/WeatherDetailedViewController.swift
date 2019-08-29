//
//  WeatherDetailedViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/28/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class WeatherDetailedViewController: UIViewController {
    
    var cityWeather: List!

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = cityWeather.name
        temperatureLabel.text = "\(String(cityWeather.main.temp)) \u{00B0}C"
    
        weatherDescriptionLabel.text = "\(cityWeather.weather[0].main):  \(cityWeather.weather[0].description)"

    }
    

}
