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
    
    func getCatBreeds(page: Int, responseValue: @escaping ([BreedRes]) -> Void, onFailure: (() -> Void)? = nil){
        catsService.getCatBreeds(page: page, responseValue: responseValue, onFailure: onFailure)
    }
    
    func getImageCatBreed(id: String, responseValue: @escaping ([ImageBreedRes]) -> Void, onFailure: (() -> Void)? = nil){
        catsService.getImageCatByBreed(id: id, responseValue: responseValue, onFailure: onFailure)
    }
    
    func getImageCats(page: Int, responseValue: @escaping ([ImageBreedRes]) -> Void, onFailure: (() -> Void)? = nil){
        catsService.getImageCats(page: page, responseValue: responseValue, onFailure: onFailure)
    }
    
    func addNewVote(id: String, urlImage: String, voteLike: Bool, responseValue: @escaping () -> Void, onFailure: (() -> Void)? = nil){
        catsService.addCatVote(id: id, url: urlImage, voteLike: voteLike, responseValue: responseValue, onFailure: onFailure)
    }
}
