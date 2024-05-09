//
//  HomeView.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Image("bgup").resizable().ignoresSafeArea())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.categs.isEmpty {
                        
                        
                    } else {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.categs, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedCat = index
                                        
                                        viewModel.fetchCats()
                                        viewModel.fetchHistories()
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index.catCat ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 20, weight: .semibold))
                                            
                                        }
                                        .padding()
                                        .padding(.horizontal)
                                        .background(RoundedRectangle(cornerRadius: 7).fill(.white).opacity(viewModel.selectedCat == index ? 1 : 0))
                                    })
                                }
                            }
                        }
                        .frame(height: 60)
                        .padding(.leading)
                    }
                    
                    HStack {
                        
                        VStack {
                            
                            ZStack {

                                Circle()
                                    .stroke(Color("primary"), lineWidth: 40)
                                    .frame(width: 150)
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                    .stroke(Color("primary2"), lineWidth: 40)
                                    .frame(width: 150)
                                    .rotationEffect(.degrees(-90))
                                
                                VStack {
                                    
                                    Text("$\(viewModel.amount)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("$\(viewModel.selectedCat?.catAmount ?? "")")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                        }
                        .padding()
                        .frame(width: 250, height: 260)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        .overlay (
                            
                            VStack {
                                
                                Image(systemName: "dollarsign.square")
                                    .foregroundColor(Color("primary").opacity(0.5))
                                    .font(.system(size: 22, weight: .semibold))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding()
                                
                                Spacer()
                            }
                        )
                        .padding(.leading)
                        
                        VStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isCurrencies = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Image(systemName: "pencil")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                    Text("\(viewModel.curr.isEmpty ? "EUR/USD" : viewModel.curr)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .semibold))
                                        .frame(maxHeight: .infinity)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 180)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                .padding(.trailing)
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddCat = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))
                            .padding(.trailing)
                            .padding(.top, 3)
                        }
                    }
                }
                
                HStack {
                    
                    Text("History")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHistory = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    })
                    .opacity(viewModel.histories.isEmpty ? 0 : 1)
                }
                .padding(.bottom)
                .padding(.horizontal)
                
                if viewModel.histories.isEmpty {
                    
                    VStack {
                        
                        VStack {
                            
                            Text("Add a new entry")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddHistory = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                                    .padding(.horizontal)
                            })
                        }
                        .padding(30)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.histories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedHistory = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text("$\(index.hisPayment ?? 0)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 22, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "dollarsign.square")
                                                .foregroundColor(Color("primary").opacity(0.5))
                                                .font(.system(size: 22, weight: .semibold))
                                        }
                                        
                                        Rectangle()
                                            .fill(.gray.opacity(0.6))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                })
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchCats()
        }
        .onAppear {
            
            viewModel.fetchHistories()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat  = false
                        }
                    }
                
                VStack {
                    
                    Text("Add an entry")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Category")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.catCat.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.catCat)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary").opacity(0.6)))
                    .padding(.horizontal)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.catAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.catAmount)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary").opacity(0.6)))
                    .padding(.horizontal)
                    
                    Button(action: {
                        
                        viewModel.categories.append(viewModel.catCat)
                        
                        viewModel.addCat()
                        
                        viewModel.catCat = ""
                        viewModel.catAmount = ""
                        
                        viewModel.fetchCats()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding()
                    })
                    .opacity(viewModel.catCat.isEmpty || viewModel.catAmount.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.catCat.isEmpty || viewModel.catAmount.isEmpty ? true : false)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddCat  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddHistory ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHistory  = false
                        }
                    }
                
                VStack {
                    
                    Text("Add an entry")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    Menu(content: {
                        
                        ForEach(viewModel.categs, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedCat = index
                                
                            }, label: {
                                
                                Text(index.catCat ?? "")
                                
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.selectedCat == nil {
                            
                            HStack {
                                
                                Text("Category")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.selectedCat?.catCat ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary").opacity(0.6)))
                    .padding(.horizontal)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.hisPayment.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.hisPayment)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary").opacity(0.6)))
                    .padding(.horizontal)
                    
                    Button(action: {
                        
                        viewModel.amount += Int(viewModel.hisPayment) ?? 0
                        
                        viewModel.hisCat = viewModel.currentCategory
                        
                        viewModel.addHistory()
                        
                        viewModel.hisPayment = ""
                        
                        viewModel.currentCategory = ""
                        viewModel.selectedCat = nil
                        
                        viewModel.fetchHistories()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHistory = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding()
                    })
                    .opacity(viewModel.selectedCat == nil || viewModel.hisPayment.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.selectedCat == nil || viewModel.hisPayment.isEmpty ? true : false)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddHistory  ? 0 : UIScreen.main.bounds.height)
            }
        )
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
                        
                        CoreDataStack.shared.deleteHis(withHisPay: String(viewModel.selectedHistory?.hisPayment ?? 0), completion: {
                            
                            viewModel.fetchHistories()
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
        .sheet(isPresented: $viewModel.isCurrencies, content: {
            
            CurrenciesView(viewModel: viewModel)
        })
    }
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.amount)
        let maxValue = Int(viewModel.selectedCat?.catAmount ?? "")
        
        let percentCircle = (Double(value) / Double(maxValue ?? 1)) * 100
        
        return percentCircle
    }
}

#Preview {
    HomeView()
}
