///**
/**

GroceryShopper
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/11/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct ShoppingItemRow: View {
    @EnvironmentObject var store: ShoppingStore
    @State private var shoppingFormPresented = false
    let shoppingItem: ShoppingItem
    
    var body: some View {
        HStack {
            Button(action: openUpdate) {
                Text("\(shoppingItem.quantity)")
                    .bold()
                    .padding(.horizontal, 4)
                
                VStack(alignment: .leading) {
                    Text(shoppingItem.title)
                        .font(.headline)
                    
                    Text(shoppingItem.notes)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }.buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $shoppingFormPresented) {
                ShoppingFormView(form: ShoppingForm(self.shoppingItem))
                    .environmentObject(self.store)
            }
            Spacer()
            Button(action: buyItem) {
                Circle().fill(Color.orange).frame(width: 20, height: 20)
            }
        }
    }
}

// MARK:- Actions

extension ShoppingItemRow {
    func openUpdate() {
        if !shoppingItem.bought {
            shoppingFormPresented.toggle()
        }
    }
    
    func buyItem() {
        withAnimation {
            if !shoppingItem.bought {
                store.updateBuy(shoppingItem: shoppingItem)
            }
        }
    }
}
