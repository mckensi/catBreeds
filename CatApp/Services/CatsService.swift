//
//  CatsService.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation
import Alamofire

class CatsService {
    
    public static let get = CatsService()
    public init() {}
    
    func getCatBreeds(responseValue: @escaping ([BreedRes]) -> Void,  onFailure: (() -> Void)? = nil){
        let url = CatsApi.breedUrl
        
        ApiAdapter.get.requestGeneric(url: url) { (response:  AFDataResponse<[BreedRes]>) in
            if let statusCode = response.response?.statusCode{
                switch statusCode {
                case 200:
                    if let value = response.value{
                        responseValue(value)
                    }
                default:
                    onFailure?()
                }
            }
        }
    }
    
    
    func getImageCatByBreed(id: String, responseValue: @escaping ([ImageBreedRes]) -> Void,  onFailure: (() -> Void)? = nil){
        let url = CatsApi.imageByBreed
        
        let params = [
            "breed_id": id
        ]
        
        ApiAdapter.get.requestGeneric(url: url, queryParams: params) { (response:  AFDataResponse<[ImageBreedRes]>) in
            if let statusCode = response.response?.statusCode{
                switch statusCode {
                case 200:
                    if let value = response.value{
                        responseValue(value)
                    }
                default:
                    onFailure?()
                }
            }
        }
    }
}
