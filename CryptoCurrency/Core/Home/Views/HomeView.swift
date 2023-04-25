//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Stanislav Lemeshaev on 23.04.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView()
            }
            .navigationTitle("Life prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
