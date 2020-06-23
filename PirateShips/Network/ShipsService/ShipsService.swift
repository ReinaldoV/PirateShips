//
//  ShipsService.swift
//  PirateShips
//
//  Created by Reinaldo Villanueva Javierre on 23/06/2020.
//  Copyright © 2020 Reinaldo Villanueva Javierre. All rights reserved.
//

import Foundation

class ShipsService {

    func getObjectives(onSuccess: @escaping ([Ship]) -> Void,
                       onError: @escaping (_ error: Error?) -> Void) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "assets.shpock.com"
        urlComponents.path = "/mobile/interview-test/pirateships"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            if let error = responseError {
                onError(error)
            } else if let jsonData = responseData {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let shipsResponse = try decoder.decode(ShipsServiceDTO.self, from: jsonData)
                    guard shipsResponse.success else {
                        onError(nil)
                        return
                    }
                    let listOfShips = ShipsServiceMapper.shipsFromShipsResponse(shipsResponse)
                    onSuccess(listOfShips)
                } catch {
                    onError(error)
                }
            }
        }

        task.resume()
    }
}
