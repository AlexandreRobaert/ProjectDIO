//
//  DogModel.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation

struct DogModel: Codable {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case barking
        case coatLength = "coat_length"
        case drooling
        case energy
        case goodWithChildren = "good_with_children"
        case goodWithOtherDogs = "good_with_other_dogs"
        case goodWithStrangers = "good_with_strangers"
        case grooming
        case imageLink = "image_link"
        case maxHeightFemale = "max_height_female"
        case maxHeightMale = "max_height_male"
        case maxLifeExpectancy = "max_life_expectancy"
        case maxWeightFemale = "max_weight_female"
        case maxWeightMale = "max_weight_male"
        case minHeightFemale = "min_height_female"
        case minHeightMale = "min_height_male"
        case minLifeExpectancy = "min_life_expectancy"
        case minWeightFemale = "min_weight_female"
        case minWeightMale = "min_weight_male"
        case name
        case playfulness
        case protectiveness
        case shedding
        case trainability
    }

    let barking: Int
    let coatLength: Int
    let drooling: Int
    let energy: Int
    let goodWithChildren: Int
    let goodWithOtherDogs: Int
    let goodWithStrangers: Int
    let grooming: Int
    let imageLink: URL
    let maxHeightFemale: Int
    let maxHeightMale: Int
    let maxLifeExpectancy: Int
    let maxWeightFemale: Int
    let maxWeightMale: Int
    let minHeightFemale: Int
    let minHeightMale: Int
    let minLifeExpectancy: Int
    let minWeightFemale: Int
    let minWeightMale: Int
    let name: String
    let playfulness: Int
    let protectiveness: Int
    let shedding: Int
    let trainability: Int
}
