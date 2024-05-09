//
//  HomeViewModel.swift
//  App450
//
//  Created by IGOR on 14/04/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @AppStorage("categories") var categories: [String] = []
    @Published var currentCategory = ""
    @Published var catCat = ""
    @Published var catAmount = ""
    
    @AppStorage("amount") var amount: Int = 0
    
    @AppStorage("curr") var curr = ""
    
    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "EUR/JPY", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currentCurrency = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isAddHistory: Bool = false
    @Published var isCurrencies: Bool = false
    @Published var isGraph: Bool = false

    @Published var categs: [CatModel] = []
    @Published var selectedCat: CatModel?

    func addCat() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CatModel", into: context) as! CatModel

        loan.catCat = catCat
        loan.catAmount = catAmount

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCats() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CatModel>(entityName: "CatModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.categs = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.categs = []
        }
    }
    
    @Published var hisCat = ""
    @Published var hisPayment = ""

    @Published var histories: [HistoryModel] = []
    @Published var selectedHistory: HistoryModel?

    func addHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel

        loan.hisCat = hisCat
        loan.hisPayment = Int16(hisPayment) ?? 0

        CoreDataStack.shared.saveContext()
    }
    
    func fetchHistories() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.histories = result.filter{($0.hisCat ?? "") == (selectedCat?.catCat ?? "")}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.histories = []
        }
    }
}

