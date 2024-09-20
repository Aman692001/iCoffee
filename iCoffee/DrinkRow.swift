//
//  DrinkRow.swift
//  iCoffee
//
//  Created by Aman on 14/05/23.
//

import SwiftUI

struct DrinkRow: View {
    
    var categoryName: String
    var drinks: [Drink]
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(self.categoryName)
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(self.drinks) { drink in
                        
                        NavigationLink(destination: DrinkDetail(drink: drink)) {
                            
                            DrinkItem(drink: drink)
                                .frame(width: 270)//300
                                .padding(.trailing, 30)
                                .padding(.horizontal, 20)// Aman changes
                            
                        } 
                    }
                }
            }
            
            
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(categoryName: "HOT DRINKS", drinks: drinkData)
    }
}
