//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 1/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListviewmodel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListviewmodel.addWeatherViewmodel(vm)
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                self.lastUnitSelection = Unit(rawValue: value)!
            }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListviewmodel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVm = weatherListviewmodel.modelAt(indexPath.row)
        
        cell.configure(weatherVm)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherViewCityViewController" {
            
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        addWeatherCityVC.delegate = self
        
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("WeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
        
        
    }
    
}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
        
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListviewmodel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
        
    }
}
