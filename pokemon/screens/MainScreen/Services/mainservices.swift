//
//  File.swift
//  pokemon
//
//  Created by Spark M1 on 13/08/2024.
//

import Foundation
class MainviewServices{
    func getcarddata(competion: @escaping (Result <Cardmodel, NetworkError>) -> Void){
        guard let url = URL(string: "https://api.pokemontcg.io/v2/cards") else {
            return competion(.failure(.requestFailed))
        }
        NetworkManager().fetchRequest( type: Cardmodel.self, url: url, completion: competion)
    }
}
