//
//  CatsApi.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation

struct CatsApi {
    
    private init() {
        
    }
    
    static let baseUrl = "https://api.thecatapi.com/v1/"
    
    static let breedUrl = baseUrl + "breeds"
    
    static let imageByBreed = baseUrl + "images/search"
    
    static let breedSearchByName = baseUrl + "breeds/search"
}

