///**
/**

GroceryShopper
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/11/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
import RealmSwift

class ShoppingItemDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var notes = ""
    @objc dynamic var quantity = 1
    @objc dynamic var bought = false
    
    override class func primaryKey() -> String? {
        "id"
    }
}
