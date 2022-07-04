//
//  File.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 01/07/2022.
//

import Realm
import RealmSwift
import Combine

class RealmManager {
    static let shared = RealmManager()

    func getRealm() -> Realm {
        do {
           return try Realm()
        } catch {
            fatalError("can not intilize realm object")
        }
    }

    func object<T: Object>(_ type: T.Type, key: Any) -> T? {
        if !isRealmAccessible() { return nil }

        let realm = getRealm()
        realm.refresh()

        return realm.object(ofType: type, forPrimaryKey: key)
    }
    
    func objects<T: Object>(ofType: T.Type) -> [T]? {
        if !isRealmAccessible() { return nil }
        let realm = getRealm()
        realm.refresh()
        return realm.objects(ofType).reversed()
    }

    func add<T: Object>(_ data: [T], update: Realm.UpdatePolicy = .all) {
        if !isRealmAccessible() { return }

        let realm = getRealm()
        realm.refresh()

        if realm.isInWriteTransaction {
            realm.add(data, update: update)
        } else {
            try? realm.write {
                realm.add(data, update: update)
            }
        }
    }
    
    func write<T: Object>(_ data: T, update: Realm.UpdatePolicy = .all) {
        if !isRealmAccessible() { return }
        let realm = getRealm()
        realm.refresh()
        try? realm.write {
            realm.add(data, update: update)
        }
    }
        

    func add<T: Object>(_ data: T, update: Realm.UpdatePolicy = .all) {
        add([data], update: update)
    }

    func delete<T: Object>(_ data: T) {
        delete([data])
    }


    func delete<T: Object>(_ data: [T]) {
        let realm = getRealm()
        realm.refresh()
        try? realm.write { realm.delete(data) }
    }

    func clearAllData() {
        if !isRealmAccessible() { return }

        let realm = getRealm()
        realm.refresh()
        try? realm.write { realm.deleteAll() }
    }
}
extension RealmManager {
    func isRealmAccessible() -> Bool {
        do { _ = try Realm() } catch {
            print("Realm is not accessible: \n\(error)")
            return false
        }
        return true
    }

    func configureRealm() {
        let config = RLMRealmConfiguration.default()
        config.deleteRealmIfMigrationNeeded = true
        RLMRealmConfiguration.setDefault(config)
    }
}
