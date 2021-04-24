//
//  RegionsAndCountriesTableVC.swift
//  CountriesApp
//
//  Created by Nikita Popov on 21.04.2021.
//

import UIKit

//protocol FetchRegionsDelegate {
//    func fetchByRegions(regionName: String)
//}


class RegionsAndCountriesTableVC: UITableViewController {
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseId)
        tableView.register(RegionCell.self, forCellReuseIdentifier: RegionCell.reuseId)
        fetchInitialData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        section == 0 ?  "Regions" : "Countries"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 250 : 45
    }

    // MARK: - FetchRequest
    
    func fetchInitialData() {
        let url = "https://restcountries-v1.p.rapidapi.com/all/?rapidapi-key=3f9506a888msh18ac831a2e2504dp1efc50jsn740844e032dd"
        fetchGenericJSONData(urlString: url) { (countries: [Country]? , error) in
            guard let safeCountries = countries else { return }
            self.countries = safeCountries
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 1), with: .right)
            }
        }
    }

    func fetchByRegions(regionName: String) {
        if regionName == "all" {
            countries.removeAll()
            fetchInitialData()
        } else {
            countries.removeAll()
            print(self.countries.count)
            let url = "https://restcountries-v1.p.rapidapi.com/region/\(regionName)/?rapidapi-key=3f9506a888msh18ac831a2e2504dp1efc50jsn740844e032dd"
            fetchGenericJSONData(urlString: url) { (countries: [Country]?, error) in
                guard let safeCountriesByRegion = countries else { return }
                self.countries = safeCountriesByRegion
                print(self.countries.count)
                print(self.countries)

                DispatchQueue.main.async {
                    self.tableView.reloadSections(IndexSet(integer: 1), with: .right)
                }
            }
        }
    }
}
