///**
/**

GroceryShopper
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/11/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation

class ShoppingForm: ObservableObject {
    @Published var title = ""
    @Published var notes = ""
    @Published var quantity = 1
    
    var shoppintItemId: Int?
    
    var updating: Bool {
        shoppintItemId != nil
    }
    
    init() {}
    
    init(_ shoppingItem: ShoppingItem) {
        shoppintItemId = shoppingItem.id
        title = shoppingItem.title
        notes = shoppingItem.notes
        quantity = shoppingItem.quantity
    }
}
