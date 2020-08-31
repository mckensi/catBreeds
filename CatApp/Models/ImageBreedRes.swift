//
//  ImageBreedRes.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation

class ImageBreedRes: Codable {
    var breeds: [BreedRes]?
    var height: Int?
    var id: String?
    var url: String?
    var width: Int?

    init(breeds: [BreedRes]?, height: Int?, id: String?, url: String?, width: Int?) {
        self.breeds = breeds
        self.height = height
        self.id = id
        self.url = url
        self.width = width
    }
}

