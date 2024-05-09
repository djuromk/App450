//
//  Tele.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct Tele: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                  
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("join")))

                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Notif()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .padding(8)
                            .background(Circle().fill(Color("join")))
                    })
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Tele(telegram: URL(string: "h")!)
}
