//
//  BreedListRes.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import Foundation

class BreedRes: Codable {
    var weight: Weight?
    var id, name: String?
    var cfaURL: String?
    var vetstreetURL: String?
    var vcahospitalsURL: String?
    var temperament, origin, countryCodes, countryCode: String?
    var breedListReDescription, lifeSpan: String?
    var indoor, lap: Int?
    var altNames: String?
    var adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    var energyLevel, grooming, healthIssues, intelligence: Int?
    var sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    var experimental, hairless, natural, rare: Int?
    var rex, suppressedTail, shortLegs: Int?
    var wikipediaURL: String?
    var hypoallergenic, catFriendly, bidability: Int?

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case breedListReDescription = "description"
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case catFriendly = "cat_friendly"
        case bidability
    }

    init(weight: Weight?, id: String?, name: String?, cfaURL: String?, vetstreetURL: String?, vcahospitalsURL: String?, temperament: String?, origin: String?, countryCodes: String?, countryCode: String?, breedListReDescription: String?, lifeSpan: String?, indoor: Int?, lap: Int?, altNames: String?, adaptability: Int?, affectionLevel: Int?, childFriendly: Int?, dogFriendly: Int?, energyLevel: Int?, grooming: Int?, healthIssues: Int?, intelligence: Int?, sheddingLevel: Int?, socialNeeds: Int?, strangerFriendly: Int?, vocalisation: Int?, experimental: Int?, hairless: Int?, natural: Int?, rare: Int?, rex: Int?, suppressedTail: Int?, shortLegs: Int?, wikipediaURL: String?, hypoallergenic: Int?, catFriendly: Int?, bidability: Int?) {
        self.weight = weight
        self.id = id
        self.name = name
        self.cfaURL = cfaURL
        self.vetstreetURL = vetstreetURL
        self.vcahospitalsURL = vcahospitalsURL
        self.temperament = temperament
        self.origin = origin
        self.countryCodes = countryCodes
        self.countryCode = countryCode
        self.breedListReDescription = breedListReDescription
        self.lifeSpan = lifeSpan
        self.indoor = indoor
        self.lap = lap
        self.altNames = altNames
        self.adaptability = adaptability
        self.affectionLevel = affectionLevel
        self.childFriendly = childFriendly
        self.dogFriendly = dogFriendly
        self.energyLevel = energyLevel
        self.grooming = grooming
        self.healthIssues = healthIssues
        self.intelligence = intelligence
        self.sheddingLevel = sheddingLevel
        self.socialNeeds = socialNeeds
        self.strangerFriendly = strangerFriendly
        self.vocalisation = vocalisation
        self.experimental = experimental
        self.hairless = hairless
        self.natural = natural
        self.rare = rare
        self.rex = rex
        self.suppressedTail = suppressedTail
        self.shortLegs = shortLegs
        self.wikipediaURL = wikipediaURL
        self.hypoallergenic = hypoallergenic
        self.catFriendly = catFriendly
        self.bidability = bidability
    }
}

// MARK: - Weight
class Weight: Codable {
    var imperial, metric: String?

    init(imperial: String?, metric: String?) {
        self.imperial = imperial
        self.metric = metric
    }
}

