//
//  CatsManager.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation

class CatsManager: NSObject {
    static let get = CatsManager()
    
    private let catsService = CatsService.get
    
    func getCatBreeds(responseValue: @escaping ([BreedRes]) -> Void, onFailure: (() -> Void)? = nil){
        catsService.getCatBreeds(responseValue: responseValue, onFailure: onFailure)
    }
    
    func getImageCatBreed(id: String, responseValue: @escaping ([ImageBreedRes]) -> Void, onFailure: (() -> Void)? = nil){
        catsService.getImageCatByBreed(id: id, responseValue: responseValue, onFailure: onFailure)
    }
}
