//
//  ContentView.swift
//  SwiftUI-Grids
//
//  Created by Ben Scheirman on 6/25/20.
//

import SwiftUI


struct ContentView: View {

    @State var columns: CGFloat = 1

    var dynamicLayout: [GridItem] {
        Array(repeating: GridItem(.flexible(minimum: 80, maximum: 180)), count: Int(columns))
    }


    var fixedLayout: [GridItem] {
        [
            .init(.fixed(80)),
            .init(.flexible())
        ]
    }

    var adaptiveLayout: [GridItem] {
        [
            .init(.adaptive(minimum: 80, maximum: 400)),
            .init(.adaptive(minimum: 280, maximum: 400))
        ]
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: dynamicLayout) {
                        ForEach(Photos.imageNames.indices) { index in
                            ZStack(alignment: .bottomTrailing) {
                                Image(Photos.imageNames[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(12)

                                Text(String(index))
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding(4)
                            }
                        }
                    }
                    .animation(.default)
                }.navigationTitle("Homes for Rent")

                Text("Columns: \(columns)")
                Slider(value: $columns, in: 1...9)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice(.init(rawValue: "iPad8,1"))
        }
    }
}



struct Photos {
    static let imageNames = [
        "reiseuhu-60xPhYfi6hA-unsplash",
        "rowan-heuvel-gExKTQFX2aA-unsplash",
        "cosmic-timetraveler-zh_ofCt2r9c-unsplash",
        "alex-vasey-3lxrM5yvkcI-unsplash",
        "pascal-bernardon-TVcj-so0GDs-unsplash",
        "hector-martinez-rUUpyVdSnek-unsplash",
        "martin-widenka-O-Z2OSuBSX0-unsplash",
        "terrah-holly-pmhdkgRCbtE-unsplash"
        ]
}
