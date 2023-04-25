//
//  CoinRowView.swift
//  CryptoCurrency
//
//  Created by Stanislav Lemeshaev on 25.04.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import SwiftUI

struct CoinRowView: View {
    var body: some View {
        HStack {
            Text("1")
                .font(.caption)
                .foregroundColor(.gray)
            
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 4)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("$20,330.00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("-5.60%")
                    .font(.caption)
                    .padding(.leading, 4)
                    .foregroundColor(.red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
