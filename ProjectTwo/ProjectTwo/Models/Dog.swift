//
//  Dog.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation

struct Dog: Codable {
    let characteristics: Characteristics
    let locations: [String]
    let name: String
    let taxonomy: Taxonomy
}

struct Taxonomy: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case classe = "class"
        case family
        case genus
        case kingdom
        case order
        case phylum
        case scientificName = "scientific_name"
    }

    let classe: String
    let family: String
    let genus: String
    let kingdom: String
    let order: String
    let phylum: String
    let scientificName: String?
}

struct Characteristics: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ageOfSexualMaturity = "age_of_sexual_maturity"
        case ageOfWeaning = "age_of_weaning"
        case averageLitterSize = "average_litter_size"
        case biggestThreat = "biggest_threat"
        case color
        case commonName = "common_name"
        case diet
        case estimatedPopulationSize = "estimated_population_size"
        case gestationPeriod = "gestation_period"
        case group
        case groupBehavior = "group_behavior"
        case habitat
        case length
        case lifespan
        case lifestyle
        case location
        case mostDistinctiveFeature = "most_distinctive_feature"
        case nameOfYoung = "name_of_young"
        case numberOfSpecies = "number_of_species"
        case otherNames = "other_name(s)"
        case predators
        case prey
        case skinType = "skin_type"
        case slogan
        case topSpeed = "top_speed"
        case weight
    }

    let ageOfSexualMaturity: String?
    let ageOfWeaning: String?
    let averageLitterSize: String?
    let biggestThreat: String?
    let color: String?
    let commonName: String?
    let diet: String?
    let estimatedPopulationSize: String?
    let gestationPeriod: String?
    let group: String?
    let groupBehavior: String?
    let habitat: String?
    let length: String?
    let lifespan: String?
    let lifestyle: String?
    let location: String?
    let mostDistinctiveFeature: String?
    let nameOfYoung: String?
    let numberOfSpecies: String?
    let otherNames: String?
    let predators: String?
    let prey: String?
    let skinType: String?
    let slogan: String?
    let topSpeed: String?
    let weight: String?
}
