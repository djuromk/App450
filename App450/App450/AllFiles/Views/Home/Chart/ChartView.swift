//
//  ChartView.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct ChartView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
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
                
                Text("Сurrency value")
                    .foregroundColor(.gray.opacity(0.6))
                    .font(.system(size: 13, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    Text("+$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                        .foregroundColor(.green)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("(\(String(format: "%.f", Double(.random(in: 0...3)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))))")
                        .foregroundColor(.green)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding(.vertical)
                
                Image("Grafik")
                    .resizable()
                    .padding(.bottom, 30)
                
                HStack {
                    
                    Button(action: {
                        
                        back.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.red))
                    })
                    
                    Button(action: {
                        
                        viewModel.curr = viewModel.currentCurrency
      
                            viewModel.isGraph = false

                            viewModel.isCurrencies = false
                            
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.green))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ChartView(viewModel: HomeViewModel())
}
