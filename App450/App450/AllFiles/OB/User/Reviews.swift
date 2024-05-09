//
//  Reviews.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 340)
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Tele(telegram: telegram)
                                .navigationBarBackButtonHidden()
                             
                        } else if isTelegram == false {
                            
                            Notif()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))
                            .padding(.bottom, 60)

                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 350)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "h")!, isTelegram: false)
}
