//
//  BreedsViewModel.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation

class BreedsViewModel{
    private let catsManager = CatsManager.get
    
    var listBreedsCatsRes: (([BreedRes]) -> Void)?
    var listBreedsCatsByNameRes: (([BreedRes]) -> Void)?
    var onFailure: (() -> Void)?
    
    func getBreedsCats(page: Int){
        if let responseValue = listBreedsCatsRes{
            catsManager.getCatBreeds(page: page, responseValue: responseValue, onFailure: onFailure)
        }
    }
    
    func getBreedsCatsByName(textSearch: String){
        if let responseValue = listBreedsCatsByNameRes{
            catsManager.getCatBreedsByName(textSearch: textSearch, responseValue: responseValue, onFailure: onFailure)
        }
    }
}
