//
//  CalculatorView.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Calculator")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Image("bgup").resizable().ignoresSafeArea())
                .padding(.bottom, 30)
                
                Text("Calculate the cost of your dream")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                HStack {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("The amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.calAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.calAmount)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    .padding(.vertical, 9)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Term (in month)")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.calTerm.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.calTerm)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    .padding(.vertical, 9)
                    
                }
                .padding(.horizontal)
                
                if viewModel.isCaclulate == false {
                    
                    VStack(spacing: 12) {
                        
                        HStack {
                            
                            Text("The amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("$ 0")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Term (in month)")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Monthly payment")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("$ 0")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                        }
                    }
                    .padding(.horizontal)
                    
                } else {
                    
                    VStack(spacing: 12) {
                        
                        HStack {
                            
                            Text("The amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.calAmount)")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Term (in month)")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(viewModel.calTerm)")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Monthly payment")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("$ \(String(format: "%.f", calculatePercentage()))")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                        }
                    }
                    .padding(.horizontal)
                }

                if viewModel.isCaclulate == false {
                    
                    Button(action: {
                        
                        viewModel.isCaclulate.toggle()

                        viewModel.result = String(format: "%.f", calculatePercentage())
                        
                        viewModel.calPayment = viewModel.result
                        
                        viewModel.addCalculation()
                        
                        viewModel.fetchCalculations()
                        
                    }, label: {
                        
                        Text("Calculate")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding()
                        
                    })
                    .opacity(viewModel.calAmount.isEmpty || viewModel.calTerm.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.calAmount.isEmpty || viewModel.calTerm.isEmpty ? true : false)
                    
                } else {
                    
                    Button(action: {
                        
                        viewModel.isCaclulate.toggle()
                        
                        viewModel.calAmount = ""
                        viewModel.calTerm = ""
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding()
                        
                    })
                }
                
                HStack {
                    
                    Text("History")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Spacer()
                    
                }
                .padding(.top)
                .padding(.leading)
                
                if viewModel.calculations.isEmpty {
                    
                    VStack {
                        
                        Text("The calculation history is empty")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.vertical, 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            .padding()
                        
                        Spacer()
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.calculations, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedCalculation = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(spacing: 12) {
                                        
                                        HStack {
                                            
                                            Text("The amount")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text("$ \(index.calAmount)")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        HStack {
                                            
                                            Text("Term (in month)")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text("\(index.calTerm)")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        HStack {
                                            
                                            Text("Monthly payment")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text("$ \(index.calPayment ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.5))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                })
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchCalculations()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteCalculation(withCalPayment: viewModel.selectedCalculation?.calPayment ?? "", completion: {
                            
                            viewModel.fetchCalculations()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.calAmount)
        let maxValue = Int(viewModel.calTerm)
        
        let percentCircle = Double(value ?? 0) / Double(maxValue ?? 1)
        
        return percentCircle
    }
}

#Preview {
    CalculatorView()
}
