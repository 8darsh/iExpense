//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Adarsh Singh on 23/03/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name : String
    var type : String
    let amount : Double
}
