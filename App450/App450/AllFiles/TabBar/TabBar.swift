//
//  TabBar.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color("primary").opacity(0.5))
                            .frame(height: 22)

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 38)
        .background(Color("bg3"))
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    case Calculator = "Calculator"
    case Settings = "Settings"
    
}
