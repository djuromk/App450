//
//  U1.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("User1")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Show your financial growth")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 340)
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
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
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
