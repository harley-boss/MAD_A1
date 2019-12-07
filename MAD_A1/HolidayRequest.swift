//
//  HolidayRequest.swift
//  MAD_A1
//
//  Created by Nathan Davis on 2019-12-07.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import Foundation

enum HolidayError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct HolidayRequest {
    let resourceURL:URL
    let API_KEY = "ea538c8ba5f33cfaf9e308dd71684a42501a6895"
    
    init(countryCode:String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat="yyyy"
        let currentYear = format.string(from: date)
        
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceURL = URL(string:resourceString) else{fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getHolidays(completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidaysResponse.response.holidays
                completion(.success(holidayDetails))
            } catch{
                completion(.failure(.canNotProcessData))
            }
            
        }
        
        dataTask.resume()
    }
}

