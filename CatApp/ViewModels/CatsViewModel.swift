//
//  CatsViewModel.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation

class CatsViewModel{
    private let catsManager = CatsManager.get
    
    var imagesCatsRes: (([ImageBreedRes]) -> Void)?
    
    var onFailure: (() -> Void)?
    
    func getBreedsCats(page: Int){
        if let responseValue = imagesCatsRes{
            catsManager.getImageCats(page: page, responseValue: responseValue, onFailure: onFailure)
        }
    }
}
