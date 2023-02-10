//
//  HomeView.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    private let dogListHorizontalSpace = 15.0

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 10)

            // Search
            VStack(alignment: .leading) {
                Text("Search for a dog breed")
                    .font(.title2)
                InputFieldView(textValue: $viewModel.searchText,
                               placeHolderText: $viewModel.searchPlaceholder)
                    .frame(height: 50)
            }
            .padding(.horizontal, 24)

            Spacer()
                .frame(height: 15)

            // Result
            ScrollView {
                let width = ((ViewGeometry.fullScreenWidth - (dogListHorizontalSpace * 2)) - 10) / 2
                VStack {
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        if index % 2 == 0 {
                            HStack(spacing: 0) {
                                CardView(viewModel: viewModel.cards[index], width: width)
                                if viewModel.cards.count > index + 1 {
                                    Spacer()
                                    CardView(viewModel: viewModel.cards[index + 1], width: width)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, dogListHorizontalSpace)
                .frame(width: ViewGeometry.fullScreenWidth)
            }
        }
        .onChange(of: viewModel.searchText, perform: { textToSearch in
            viewModel.searchDog(text: textToSearch)
        })
        .background(AppColor.vistaWhite.color)
    }
}

struct HomeView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModelMockData.mockData)
    }
}
