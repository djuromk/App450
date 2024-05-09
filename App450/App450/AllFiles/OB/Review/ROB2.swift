//
//  ROB2.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct ROB2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Review2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("The ability to edit and delete a record at any time")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 340)
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        ROB3()
                            .navigationBarBackButtonHidden()
                        
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
    ROB2()
}
