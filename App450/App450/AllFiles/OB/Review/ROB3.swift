//
//  ROB3.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct ROB3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Review3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Creating calculations with the ability to manage records")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 340)
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))
                            .padding(.bottom, 40)

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
    ROB3()
}
