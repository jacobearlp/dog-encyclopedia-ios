//
//  ProfileView.swift
//  DogEncyclopedia
//
//  Created by Jacob on 2/11/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DCCachedAsyncImage(url: URL(string: "https://raw.githubusercontent.com/jigsawpieces/dog-api-images/master/affenpinscher/n02110627_9822.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 450)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(.teal)
                        .frame(height: 350)
                        .cornerRadius(12)
                }

                VStack(alignment: .leading) {
                    HStack {
                        Text("Doberman")
                    }
                    HStack {
                        VStack {
                            Text("Height")
                            Text("1-1.5 meters")
                        }
                        VStack {
                            Text("Weight")
                            Text("9-10 pounds")
                        }
                        VStack {
                            Text("Lifespan")
                            Text("10-12 years")
                        }
                    }
                    Text("The Affenpinscher is a small, toy-sized dog breed that originated in Germany. The breed is known for its distinctive facial features, including a shaggy beard, mustache, and eyebrows, which give it a monkey-like appearance. Affenpinschers are energetic, playful, and affectionate dogs that make good companion pets. They are intelligent and quick learners, but can be stubborn at times, so training and socialization are important for their well-being. Affenpinschers are generally healthy and hardy dogs, with a lifespan of 12-15 years.")

                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .overlay(
                                Text("View more info")
                                    .foregroundColor(.white)
                            )
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            VStack(alignment: .leading) {
                Button(action: {}) {
                    Text("Go back")
                        .background(.blue)
                }
                Spacer()
            }
            .padding(.horizontal, 18)
            .safeAreaInset(edge: .top, content: {
                EmptyView()
            })
        )
    }
}

struct ProfileView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
