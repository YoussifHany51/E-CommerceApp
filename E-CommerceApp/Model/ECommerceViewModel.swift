//
//  ViewModel.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 02/04/2024.
//

import Foundation

@MainActor
class ECommerceViewModel:ObservableObject{
    @Published var categries: [Category] = []
    
    
    func getData<T:Decodable>(for:T.Type,from url : String) async throws -> T{
        guard let url = URL(string: url) else {throw APIError.invalidURL}
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let returnedData = try decoder.decode(T.self, from: data)
            return returnedData
        } catch  {
            throw APIError.invalidData
        }

    }
    
    func getCategoryData() async throws ->[Category] {
        let endpoint = "https://api.escuelajs.co/api/v1/categories"
        do {
           let returedData = try await getData(for: [Category].self, from: endpoint)
            return returedData
        } catch {
            throw APIError.invalidData
        }
    }
}

enum APIError:Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
