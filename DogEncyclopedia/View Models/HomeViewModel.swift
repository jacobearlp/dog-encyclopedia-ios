//
//  HomeViewModel.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var cards: [CardViewModel] = []

    private let dogsInLocal: [DogModel]

    init() {
        dogsInLocal = HomeViewModel.getDogs()
        cards = dogsInLocal.map { CardViewModel(model: CardModel(dog: $0)) }
    }

    init(cards: [CardModel]) {
        dogsInLocal = HomeViewModel.getDogs()
        self.cards = cards.map { CardViewModel(model: $0) }
    }

    func searchDog(text: String) {
        var dogResult = dogsInLocal
        if !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            dogResult = dogsInLocal.filter { $0.breedName.contains(text) }
                .sorted(by: { $0.breedName < $1.breedName })
        }
        cards = dogResult
            .map { CardViewModel(model: CardModel(dog: $0)) }
    }

    private static func getDogs() -> [DogModel] {
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: "dogs", withExtension: "json") else { return [] }
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try! Data(contentsOf: url)
            let dogs = try decoder.decode(DogsResult.self, from: data).dogs
            return dogs
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}

struct DogsResult: Codable {
    var dogs: [DogModel]

    enum CodingKeys: String, CodingKey {
        case dogs
    }
}

struct DogModel: Codable {
    var breedName: String
    var imageUrls: [URL]?

    enum CodingKeys: String, CodingKey {
        case breedName, imageUrls
    }
}
