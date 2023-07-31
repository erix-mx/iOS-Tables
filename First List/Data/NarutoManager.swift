//
//  NarutoManager.swift
//  First List
//
//  Created by Erix on 28/07/23.
//

import Foundation
import Alamofire

protocol NarutoManagerDelegate {
    func didError(error: String?)
    func didSuccess(character: [NarutoModel])
}

class NarutoManager {
    
    var delegate: NarutoManagerDelegate? = nil
    
    func fetchService() {
        
        let endpointString = "https://api.narutodb.xyz/clan?page=1&limit=20"
        guard let endPoint = URL(string: endpointString) else { return }
        
        AF.request(endpointString, method: .get, parameters: nil).responseData { (response: AFDataResponse<Data>) in
            if response.error != nil {
                self.delegate?.didError(error: response.error?.errorDescription ?? "Unknown")
                return
            }
            guard
                let dataFromService = response.data,
                let model: NarutoData = try? JSONDecoder().decode(NarutoData.self, from: dataFromService) else {
                    return
                }
            
            let clans = model.clans.map { clan in
                return clan.characters
            }
            
           
            
            let modelList = clans.flatMap { clans in
                return clans.compactMap { return NarutoModel(name: $0.name, urlImage: $0.images.first ) }
            }
            self.delegate?.didSuccess(character: modelList)
        }
        
    }
}
