///**
/**

GroceryShopper
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/11/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

@main
struct GroceryShopperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ShoppingStore(realm: RealmPersistent.initializer()))
        }
    }
}
