//
//  SettingsView.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Image("bgup").resizable().ignoresSafeArea())

                VStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular))
                            
                            Text("Rate Us")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular))
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                    
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular))
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
