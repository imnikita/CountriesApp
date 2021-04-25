//
//  CountryVC.swift
//  CountriesApp
//
//  Created by Nikita Popov on 24.04.2021.
//

import UIKit

class CountryVC: UIViewController {
    
    let countryView = UIView()
    let capitalLabel = UILabel()
    let populationLabel = UILabel()
    let bordersLabel = UILabel()
    let regionLabel = UILabel()
    let subregionLabel = UILabel()
    let timeZoneLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
    }
    
    
    func fetchCountry(countryName: String) {
        let url = "https://restcountries-v1.p.rapidapi.com/name/\(countryName)/?rapidapi-key=3f9506a888msh18ac831a2e2504dp1efc50jsn740844e032dd"
        
        fetchGenericJSONData(urlString: url) { (country: [Country]?, error) in
            
            guard let country = country?.first else { return }
            DispatchQueue.main.async {
                
                self.navigationItem.title = country.name
                
                self.capitalLabel.text = "Capital: \(country.capital)"
                self.populationLabel.text = "Population: \(country.population) people."
                if country.borders.isEmpty {
                    self.bordersLabel.text = "Borders with: there are no land borders."
                } else {
                    self.bordersLabel.text =
                        "Borders with: \((country.borders.map{$0}).joined(separator: ", "))."
                }
                self.regionLabel.text = "Region: \(country.region.rawValue.uppercased())."
                self.subregionLabel.text = "Subregion: \(country.subregion)."
                self.timeZoneLabel.text = "Time zones: \((country.timezones.map{$0}).joined(separator: ", "))."
            }
        }
    }
    
    func setupUI() {
        view.addSubview(countryView)
        countryView.backgroundColor = .systemBackground
        countryView.fillSuperview()
        
        countryView.addSubview(capitalLabel)
        capitalLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        capitalLabel.anchor(top: view.topAnchor, leading: countryView.leadingAnchor, bottom: nil, trailing: countryView.trailingAnchor, padding: .init(top: 150, left: 22, bottom: 0, right: 5), size: CGSize.init(width: countryView.frame.width, height: 80))
        
        countryView.addSubview(populationLabel)
        populationLabel.anchor(top: capitalLabel.bottomAnchor, leading: capitalLabel.leadingAnchor, bottom: nil, trailing: capitalLabel.trailingAnchor)
        
        countryView.addSubview(bordersLabel)
        bordersLabel.numberOfLines = 0
        bordersLabel.anchor(top: populationLabel.bottomAnchor, leading: populationLabel.leadingAnchor, bottom: nil, trailing: populationLabel.trailingAnchor)
        
        countryView.addSubview(regionLabel)
        regionLabel.anchor(top: bordersLabel.bottomAnchor, leading: bordersLabel.leadingAnchor, bottom: nil, trailing: bordersLabel.trailingAnchor)
        
        countryView.addSubview(subregionLabel)
        subregionLabel.anchor(top: regionLabel.bottomAnchor, leading: regionLabel.leadingAnchor, bottom: nil, trailing: regionLabel.trailingAnchor)
        
        countryView.addSubview(timeZoneLabel)
        timeZoneLabel.numberOfLines = 0
        timeZoneLabel.anchor(top: subregionLabel.bottomAnchor, leading: subregionLabel.leadingAnchor, bottom: nil, trailing: subregionLabel.trailingAnchor)
        
        [populationLabel, bordersLabel, regionLabel, subregionLabel, timeZoneLabel].forEach{
            $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        }
    }
    
}
