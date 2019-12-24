//
//  DataManager.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 23/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

class DataManager {
    
    static func handleServerError(error: Error) {
        print("Error: \(error)")
    }
    
    
    //Gets the list of conferences as an array of Conference objects from the api service
    static func getCollegeFootballConferences(completion: @escaping (_ results:[Conference]?) -> Void) {
        
        let url = URL(string: "https://api.collegefootballdata.com/conferences")
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil)
                if let error = error {
                    handleServerError(error: error)
                }
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let conferences = try JSONDecoder().decode([Conference].self, from: data)
                completion(conferences)
            } catch {
                print("JSON parsing error: \(error) - for service: \(url!.absoluteString)")
            }
        }
        
        task.resume()
    }
    
    //Gets the list of teams from a conference as an array of Team objects from the api service
    static func getTeamsFromConference(conferenceAbbreviation: String, completion: @escaping (_ results:[Team]?) -> Void) {
        
        let url = URL(string: "https://api.collegefootballdata.com/teams?conference=" + conferenceAbbreviation)
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil)
                if let error = error {
                    handleServerError(error: error)
                }
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let teams = try JSONDecoder().decode([Team].self, from: data)
                completion(teams)
            } catch {
                print("JSON parsing error: \(error) - for service: \(url!.absoluteString)")
            }
        }
        
        task.resume()
    }
    
}
