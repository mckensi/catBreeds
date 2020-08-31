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
    
    var onFailure: (() -> Void)?
    
    func getBreedsCats(){
        if let responseValue = listBreedsCatsRes{
            catsManager.getCatBreeds(responseValue: responseValue, onFailure: onFailure)
        }
    }
}
