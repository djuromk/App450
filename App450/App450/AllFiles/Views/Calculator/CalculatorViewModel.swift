//
//  CalculatorViewModel.swift
//  App450
//
//  Created by IGOR on 15/04/2024.
//

import SwiftUI
import CoreData

final class CalculatorViewModel: ObservableObject {

    @Published var calAmount = ""
    @Published var calPayment = ""
    @Published var calTerm = ""
    
    @Published var result = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var isCaclulate: Bool = false

    @Published var calculations: [CalcModel] = []
    @Published var selectedCalculation: CalcModel?

    func addCalculation() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CalcModel", into: context) as! CalcModel

        loan.calAmount = Int16(calAmount) ?? 0
        loan.calPayment = calPayment
        loan.calTerm = Int16(calTerm) ?? 0
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchCalculations() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CalcModel>(entityName: "CalcModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.calculations = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.calculations = []
        }
    }
}
