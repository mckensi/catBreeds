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
    var addVote: (() -> Void)?
    
    var onFailure: (() -> Void)?
    
    func getBreedsCats(page: Int){
        if let responseValue = imagesCatsRes{
            catsManager.getImageCats(page: page, responseValue: responseValue, onFailure: onFailure)
        }
    }
    
    func addVoteLike(id: String, urlImage: String, voteLike: Bool){
          if let responseValue = addVote{
              catsManager.addNewVote(id: id, urlImage: urlImage, voteLike: voteLike, responseValue: responseValue, onFailure: onFailure)
          }
      }
}
