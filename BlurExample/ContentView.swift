//
//  ContentView.swift
//  BlurExample
//
//  Created by Edwin Bosire on 19/06/2019.
//  Copyright © 2019 Edwin Bosire. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var blurAmount: Double = 0.0
    @State var contrastAmount: Double = 1.0
    @State var grayScale: Double = 0.0
    @State var selectedImage = 0

    private let images = ["lioness", "tiger", "leopard", "cheetah", "wolf"]

    var body: some View {
        NavigationView {
        ZStack (alignment: .bottom) {
            Image(self.images[selectedImage])
                .resizable()
                .scaledToFill()
                .blur(radius: CGFloat(blurAmount))
                .contrast(contrastAmount)
                .grayscale(grayScale)
            
            Form {
                Picker(selection: $selectedImage, label: Text("Choose cat")) {
                    ForEach(0 ..< self.images.count) {
                        Text(self.images[$0].capitalized).tag($0)
                    }
                }
                
                Slider(value: $blurAmount,from: 0.0, through: 100.0, by: 0.1)
                Text("Adding \(blurAmount)% Blur to Image")
                
                Slider(value: $contrastAmount, from: 0.0, through: 1.0, by: 0.01)
                Text("Adjusting contrast to \(contrastAmount)% ")
                
                Slider(value: $grayScale,from: 0.0, through: 100.0, by: 0.1)
                Text("Adding \(grayScale)% grayscale to Image")
            }
                .padding()
                .frame(height: 450, alignment: .leading)
                .background(Color.white)
                .shadow(radius: 5)
                .cornerRadius(10)
            }
            }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
