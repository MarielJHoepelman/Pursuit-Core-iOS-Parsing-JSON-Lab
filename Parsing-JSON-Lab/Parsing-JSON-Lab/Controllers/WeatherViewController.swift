//
//  WeatherViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/28/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var weather: WeatherJSON!
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
//        loadData()
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("Coudn't find json file")
        }
        print(pathToJSONFile)
        //its a reference to the actual location  of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            //turn contents of file into usabel data
            let data = try
                //decode data to create
                Data(contentsOf: url)
            let weatherFromJSON = try WeatherJSON.getWeather(from: data)
            weather = weatherFromJSON
        } catch {
            print(error)
        }
        
    }

}

extension WeatherViewController: UITableViewDelegate {
    
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell")
        cell?.textLabel?.text = weather?.locationWeather[indexPath.row].name
        return cell!
    }
}
