//
//  APICaller.swift
//  Covid Tracker
//
//  Created by MUGABE RICHARD on 04/07/2021.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    private init() {}
    
    private struct Constants {
        static let allStatesUrl = URL(string: "https://api.covidtracking.com/v2/states.json")
    }
    enum DataScope {
        case national
        case state(State)
    }
    
    public func getCovidData(
        for scope: DataScope,
        completion: @escaping (Result<String, Error>) -> Void
    
    ) {
        
    }
    
    public func getStateList(completion: @escaping (Result<[State], Error>)-> Void
    ) {
        guard let url = Constants.allStatesUrl else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do{
                let result = try JSONDecoder().decode(StateListResponse.self, from: data)
                let States = result.data
                completion(.success(States))
                
                
            }
            catch {
                completion(.failure(error))
                
            }
        }
        task.resume()
    }
}
// MARK: -Models
struct StateListResponse: Codable {
    let data: [State]
    
}
struct State: Codable {
    let name: String
    let state_code: String
}
