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
        loadData()
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
            print(weather)
        } catch {
            print(error)
        }
        
    
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let crayonDetailedViewController = segue.destination as? CrayonsDetailedViewController else {fatalError()}
//
//        guard let selectedIndexPath = CrayonsTableVIew.indexPathForSelectedRow else {fatalError()}
//
//        crayonDetailedViewController.crayon = crayons[selectedIndexPath.row]
//
    //}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let WeatherDVC = segue.destination as? WeatherDetailedViewController else
        {fatalError("No weather found")}
        guard let selectedIndexPath = weatherTableView.indexPathForSelectedRow else {fatalError()}
        
        WeatherDVC.cityWeather = weather?.list[selectedIndexPath.row]
    }

}

extension WeatherViewController: UITableViewDelegate {
    
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell")
        cell?.textLabel?.text = weather?.list[indexPath.row].name
        return cell!
    }
}
