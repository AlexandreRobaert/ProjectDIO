//
//  DogModel.swift
//  ProjectTwo
//
//  Created by Alexandre Robaert on 14/10/23.
//

import Foundation

class DogModel: Codable, ObservableObject {
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
    
    init(barking: Int, coatLength: Int, drooling: Int, energy: Int, goodWithChildren: Int, goodWithOtherDogs: Int, 
         goodWithStrangers: Int, grooming: Int, imageLink: URL, maxHeightFemale: Int, maxHeightMale: Int, maxLifeExpectancy: Int,
         maxWeightFemale: Int, maxWeightMale: Int, minHeightFemale: Int, minHeightMale: Int, minLifeExpectancy: Int,
         minWeightFemale: Int, minWeightMale: Int, name: String, playfulness: Int, protectiveness: Int, shedding: Int, trainability: Int) {
        self.barking = barking
        self.coatLength = coatLength
        self.drooling = drooling
        self.energy = energy
        self.goodWithChildren = goodWithChildren
        self.goodWithOtherDogs = goodWithOtherDogs
        self.goodWithStrangers = goodWithStrangers
        self.grooming = grooming
        self.imageLink = imageLink
        self.maxHeightFemale = maxHeightFemale
        self.maxHeightMale = maxHeightMale
        self.maxLifeExpectancy = maxLifeExpectancy
        self.maxWeightFemale = maxWeightFemale
        self.maxWeightMale = maxWeightMale
        self.minHeightFemale = minHeightFemale
        self.minHeightMale = minHeightMale
        self.minLifeExpectancy = minLifeExpectancy
        self.minWeightFemale = minWeightFemale
        self.minWeightMale = minWeightMale
        self.name = name
        self.playfulness = playfulness
        self.protectiveness = protectiveness
        self.shedding = shedding
        self.trainability = trainability
    }
}
