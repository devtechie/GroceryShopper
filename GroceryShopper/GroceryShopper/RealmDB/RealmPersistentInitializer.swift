///**
/**

GroceryShopper
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/11/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
import RealmSwift

class RealmPersistent {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            fatalError("Failed to open Realm error: \(err.localizedDescription)")
        }
    }
}
