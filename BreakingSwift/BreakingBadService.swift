//
//  BreakingBadService.swift
//  BreakingBad
//
//  Created by Nick Raptis on 12/30/20.
//

import Foundation
import Combine

class BreakingBadService {
    
    typealias CharacterRequestCompletion = ((Result<CharacterData, Error>) -> Void)
    
    static private var baseURL = "https://breakingbadapi.com/api/characters"
    
    private var cancelable: AnyCancellable?
    
    func makeRequest(completion: @escaping CharacterRequestCompletion) {
        
        guard let url = URL(string: BreakingBadService.baseURL) else {
            return
        }
        
        var modelList = [CharacterModel]()
        
        cancelable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: [CharacterModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { receivedCompletion in
                switch receivedCompletion {
                case .finished:
                    completion(.success(CharacterData(modelList: modelList)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }, receiveValue: { receivedModelList in
                modelList.append(contentsOf: receivedModelList)
            })
    }
}



