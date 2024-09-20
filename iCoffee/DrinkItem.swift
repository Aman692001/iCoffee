//
//  DrinkItem.swift
//  iCoffee
//
//  Created by Aman on 15/05/23.
//

import SwiftUI

struct DrinkItem: View {
    
    var drink: Drink
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Image(drink.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)// default width: 300
                .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(drink.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                
                Text(drink.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
            
        }
    }
}

struct DrinkItem_Previews: PreviewProvider {
    static var previews: some View {
        
        DrinkItem(drink: drinkData[0])
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Detail Title")
            // 1
            .toolbar {

                // 2
                ToolbarItem(placement: .navigationBarLeading) {

                    Button {
                        // 3
                        print("Custom Action")

                    } label: {
                        // 4
                        HStack {

                            Image(systemName: "chevron.backward")
                            Text("Custom Back")
                        }
                    }
                }
            }
    }
}
