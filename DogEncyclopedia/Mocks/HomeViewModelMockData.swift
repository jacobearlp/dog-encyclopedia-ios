//
//  HomeViewModelMockData.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/10/23.
//

import Foundation

class HomeViewModelMockData {
    static let mockData = HomeViewModel(cards: [
        CardModel(imageUrl: URL(string: "https://raw.githubusercontent.com/jigsawpieces/dog-api-images/main/boxer/n02108089_9724.jpg"),
                  heading: "Boxer",
                  subheading: "This dog is a boxer",
                  isFavorite: false,
                  favoriteIconName: "heart"),
        CardModel(imageUrl: URL(string: "https://raw.githubusercontent.com/jigsawpieces/dog-api-images/main/boxer/n02108089_9778.jpg"),
                  heading: "Boxer",
                  subheading: "This dog is a boxer",
                  isFavorite: false,
                  favoriteIconName: "heart")
    ])
}
