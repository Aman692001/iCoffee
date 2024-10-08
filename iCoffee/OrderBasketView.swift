//
//  OrderBasketView.swift
//  iCoffee
//
//  Created by Aman on 16/05/23.
//

import SwiftUI

struct OrderBasketView: View {
    
    @ObservedObject var basketListener = BasketListener()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section {
                    ForEach(self.basketListener.orderBasket?.items ?? []) {
                        drink in
                        HStack {
                            Text(drink.name)
                            Spacer()
                            Text("$\(drink.price.clean)")
                        }//end of Hstack
                    }//end of ForEach
                    .onDelete { (indexSet) in
                        self.deleteItems(at: indexSet)
                    }
                }
                
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }.disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
                
            } //end of list
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            
            
        } // End of Navigation view
    }
    
    func deleteItems(at offsets: IndexSet) {
        self.basketListener.orderBasket.items.remove(at: offsets.first!)
        self.basketListener.orderBasket.saveBasketToFirestore()
    }
    
    
}

struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
