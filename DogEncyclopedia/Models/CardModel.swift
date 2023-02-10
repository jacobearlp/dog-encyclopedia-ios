//
//  CardModel.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/10/23.
//

import Foundation

struct CardModel: Hashable {
    var imageUrl: URL?
    var heading: String
    var subheading: String
    var isFavorite: Bool
    var favoriteIconName: String

    init(imageUrl: URL? = nil, heading: String, subheading: String, isFavorite: Bool, favoriteIconName: String) {
        self.imageUrl = imageUrl
        self.heading = heading
        self.subheading = subheading
        self.isFavorite = isFavorite
        self.favoriteIconName = favoriteIconName
    }

    init(dog: DogModel) {
        self.init(imageUrl: dog.imageUrls?.first,
                  heading: dog.breedName,
                  subheading: "",
                  isFavorite: false,
                  favoriteIconName: "heart")
    }
}
