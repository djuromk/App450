//
//  Notif.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI
import OneSignalFramework

struct Notif: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Notifications")
                    .resizable()
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                            status = true
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable notification")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))

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
                    
                    Button(action: {
                        
                        status = true
                        
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
    Notif()
}
