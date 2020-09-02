//
//  BreedDetailViewModel.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation


class BreedDetailViewModel{
    private let catsManager = CatsManager.get
    
    var imageBreedRes: (([ImageBreedRes]) -> Void)?
    var onFailure: (() -> Void)?
    
    func getBreedsCats(id: String){
        if let responseValue = imageBreedRes{
            catsManager.getImageCatBreed(id: id, responseValue: responseValue, onFailure: onFailure)
        }
    }
}
