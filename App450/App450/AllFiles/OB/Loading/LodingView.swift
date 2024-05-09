//
//  LodingView.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct LodingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("lbg")
                    .resizable()
                    .ignoresSafeArea()
            }
            VStack {
                
                Image("logoOne")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding()
                
                ProgressView()
            }
        }
    }
}

#Preview {
    LodingView()
}
