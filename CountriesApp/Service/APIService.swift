//
//  APIService.swift
//  CountriesApp
//
//  Created by Nikita Popov on 22.04.2021.
//

import Foundation

func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()){
    guard let safeURL = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: safeURL) { (data, response, error) in
        if let error = error{
            print("Error in API call: ", error)
            completion(nil, error)
            return
        }
        guard let saveData = data else { return }
        do {
            let objects = try JSONDecoder().decode(T.self, from: saveData)
            completion(objects, nil)
        } catch let error {
            print("Error with JSON decoding: ", error)
            completion(nil, error)
            return
        }
    }.resume()
}
