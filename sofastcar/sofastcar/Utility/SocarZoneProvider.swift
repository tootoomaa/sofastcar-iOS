//
//  SocarZoneProvider.swift
//  sofastcar
//
//  Created by Woobin Cheon on 2020/09/14.
//  Copyright © 2020 김광수. All rights reserved.
//

import Foundation

final class SocarZoneProvider: SocarZoneProvidable {
  
  private let dispatchGroup = DispatchGroup()
  
  func fetchSocarZoneData<T>(
    endpoint: EndPoint,
    completionHandler: @escaping (Result<T, ServiceError>) -> Void
  ) where T: Decodable {
    guard let url = endpoint.combineURL() else { return completionHandler(.failure(.invalidURL)) }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwidXNlcm5hbWUiOiJnaG9zdEBleGFtcGxlLmNvbSIsImV4cCI6MTYwMDE2ODc1NywiZW1haWwiOiJnaG9zdEBleGFtcGxlLmNvbSIsIm9yaWdfaWF0IjoxNTk5NTYzOTU3fQ.zjJwe8Dx-NP1pQygSEevvAjLD39dqQm2cU-HDq5vHcw", forHTTPHeaderField: "Authorization")
    dispatchGroup.enter()
    URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
      defer { self?.dispatchGroup.leave() }
      guard error == nil else { return completionHandler(.failure(.clientError(error!))) }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completionHandler(.failure(.invalidStatusCode)) }
        print("Response Code: \(header.statusCode)")
      guard let data = data else { return completionHandler(.failure(.noData)) }
      
      do {
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        self?.dispatchGroup.notify(queue: .main) {
          completionHandler(.success(decodedData))
        }
      } catch {
        completionHandler(.failure(.decodingError(error)))
      }
    }.resume()
  }
}