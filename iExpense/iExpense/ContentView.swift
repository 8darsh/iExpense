//
//  ContentView.swift
//  iExpense
//
//  Created by Adarsh Singh on 22/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingExpense = false
    @State private var addamount = 0.0
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: "usd"))
                        }
                    
                }
                .onDelete(perform: removeItems )
                
            }
            .navigationTitle("iExpense")
            
            .toolbar{
                Button{
                    addItemAmount()
                    showingExpense = true
                
                }label: {
                    Image(systemName: "plus")
                }
                Text("$\((Int)(addamount))")
                    
            }
            
            .sheet(isPresented: $showingExpense){
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets : IndexSet){
        expenses.items.remove(atOffsets : offsets)
    }
    func addItemAmount(){
        for i in expenses.items{
            addamount += i.amount
        }
    }
    
}
   


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
