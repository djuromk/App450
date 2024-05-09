//
//  CurrenciesView.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency change")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Button(action: {
                        
                        back.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    })
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isGraph = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        
                                        Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Text("+$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                            .foregroundColor(.green)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            })
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGraph, content: {
            
            ChartView(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrenciesView(viewModel: HomeViewModel())
}
