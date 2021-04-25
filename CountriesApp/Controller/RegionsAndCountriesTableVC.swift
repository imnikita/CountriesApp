//
//  RegionsAndCountriesTableVC.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit


class RegionsAndCountriesTableVC: UITableViewController {
    
    var countries = [Country]()
    var regionName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseId)
        tableView.register(RegionCell.self, forCellReuseIdentifier: RegionCell.reuseId)
        fetchInitialData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RegionCell.reuseId, for: indexPath) as! RegionCell
            cell.callback = { regionName in
                self.regionName = regionName
                self.fetchByRegions(regionName: regionName)
                tableView.reloadData()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseId, for: indexPath) as! CountryCell
            cell.textLabel?.text = countries[indexPath.row].name
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ?  "Regions" : regionName?.uppercased() ?? "All countries"
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 250 : 45
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CountryVC()
        vc.fetchCountry(countryName: countries[indexPath.row].name)
        vc.navigationItem.title = countries[indexPath.row].name
        vc.showLoadingView()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - FetchRequests methods
    
    func fetchInitialData() {
        let url = "https://restcountries-v1.p.rapidapi.com/all/?rapidapi-key=\(apiKey)"
        fetchGenericJSONData(urlString: url) { (countries: [Country]? , error) in
            if error != nil {
                presentAlert(viewController: self, title: "Ooops!", message: error!.localizedDescription)
            } else {
                guard let safeCountries = countries else { return }
                self.countries = safeCountries
                DispatchQueue.main.async {
                    self.tableView.reloadSections(IndexSet(integer: 1), with: .right)
                }
            }
        }
    }
    
    
    func fetchByRegions(regionName: String) {
        if regionName == "all" {
            countries.removeAll()
            fetchInitialData()
        } else {
            countries.removeAll()
            let url = "https://restcountries-v1.p.rapidapi.com/region/\(regionName)/?rapidapi-key=\(apiKey)"
            fetchGenericJSONData(urlString: url) { (countries: [Country]?, error) in
                if error != nil {
                    presentAlert(viewController: self, title: "Ooops!", message: error!.localizedDescription)
                } else {
                    guard let safeCountriesByRegion = countries else { return }
                    self.countries = safeCountriesByRegion
                    DispatchQueue.main.async {
                        self.tableView.reloadSections(IndexSet(integer: 1), with: .right)
                    }
                }
            }
        }
    }
}
