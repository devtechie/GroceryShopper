///**
/**

GroceryShopper
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 10/11/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
import RealmSwift

final class ShoppingStore: ObservableObject {
    private var itemResults: Results<ShoppingItemDB>
    private var boughtItemResults: Results<ShoppingItemDB>
    
    var items: [ShoppingItem] {
        itemResults.map(ShoppingItem.init)
    }
    
    var boughtItem: [ShoppingItem] {
        boughtItemResults.map(ShoppingItem.init)
    }
    
    init(realm: Realm) {
        itemResults = realm.objects(ShoppingItemDB.self).filter("bought = false")
        boughtItemResults = realm.objects(ShoppingItemDB.self).filter("bought = true")
    }
}

// MARK: - CRUD operations

extension ShoppingStore {
    func create(title: String, notes: String, quantity: Int) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            let shoppingItemDB = ShoppingItemDB()
            shoppingItemDB.id = UUID().hashValue
            shoppingItemDB.title = title
            shoppingItemDB.notes = notes
            shoppingItemDB.quantity = quantity
            
            try realm.write {
                realm.add(shoppingItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func updateBuy(shoppingItem: ShoppingItem) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(
                    ShoppingItemDB.self,
                    value: [
                        ShoppingItemDBKeys.id.rawValue: shoppingItem.id,
                        ShoppingItemDBKeys.bought.rawValue: !shoppingItem.bought
                    ],
                    update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func updateItem(itemId: Int, title: String, notes: String, quantity: Int) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(
                    ShoppingItemDB.self,
                    value: [
                        ShoppingItemDBKeys.id.rawValue: itemId,
                        ShoppingItemDBKeys.title.rawValue: title,
                        ShoppingItemDBKeys.notes.rawValue: notes,
                        ShoppingItemDBKeys.quantity.rawValue: quantity
                    ],
                    update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func delete(itemId: Int) {
        objectWillChange.send()
        
        guard let shoppingItemDB = boughtItemResults.first (where: {$0.id == itemId}) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(shoppingItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
}
