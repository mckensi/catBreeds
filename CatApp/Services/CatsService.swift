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
    
    func getCatBreeds(page: Int, responseValue: @escaping ([BreedRes]) -> Void,  onFailure: (() -> Void)? = nil){
        let url = CatsApi.breedUrl
        let pageString = "\(page)"
        let params = [
            "page": pageString,
            "limit": "20"
        ]
        
        ApiAdapter.get.requestGeneric(url: url, queryParams: params) { (response:  AFDataResponse<[BreedRes]>) in
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
    
    func getCatBreedsByName(textSearch: String, responseValue: @escaping ([BreedRes]) -> Void,  onFailure: (() -> Void)? = nil){
        let url = CatsApi.breedUrl
        
        let params = [
            "q": textSearch
        ]
        
        ApiAdapter.get.requestGeneric(url: url, queryParams: params) { (response:  AFDataResponse<[BreedRes]>) in
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
    
    func getImageCats(page: Int, responseValue: @escaping ([ImageBreedRes]) -> Void,  onFailure: (() -> Void)? = nil){
          let url = CatsApi.imageByBreed
          let pageString = "\(page)"
          let params = [
              "page": pageString,
              "limit": "20"
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
    
    func addCatVote(id: String, url: String, voteLike: Bool, responseValue: @escaping () -> Void,  onFailure: (() -> Void)? = nil){
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newImageVote = CatImages(context: context)
        newImageVote.id = id
        newImageVote.urlImage = url
        newImageVote.voteLike = voteLike
        
         do {
             try context.save()
             responseValue()
         }
         catch{
             print("Error al añadir Colaborador")
             onFailure?()
         }
     }
    

}
