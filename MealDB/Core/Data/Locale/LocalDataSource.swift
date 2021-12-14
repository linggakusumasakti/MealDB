//
//  LocalDataSource.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 14/12/21.
//

import Foundation
import RealmSwift
import Combine
import UIKit

protocol LocalDataSourceProtocol {
    func setFavorite(favoriteEntity: FavoriteEntity) -> AnyPublisher<Bool, Error>
    func getFavorites() -> AnyPublisher<[FavoriteEntity], Error>
    func getFavorite(id: String) -> AnyPublisher<FavoriteEntity, Error>
}

final class LocalDataSource {
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocalDataSource = { realmDatabase in
        return LocalDataSource(realm: realmDatabase)
    }
    
}

extension LocalDataSource: LocalDataSourceProtocol {
    func setFavorite(favoriteEntity: FavoriteEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> {completion in
            if let realm = self.realm {
                do{
                    let favorite = realm.object(ofType: FavoriteEntity.self, forPrimaryKey: favoriteEntity.id)
                    try realm.write {
                        if let favorited = favorite {
                            realm.delete(favorited)
                            completion(.success(false))
                        } else {
                            realm.add(favoriteEntity, update: .all)
                            completion(.success(true))
                        }
                        
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavorites() -> AnyPublisher<[FavoriteEntity], Error> {
        return Future<[FavoriteEntity], Error> { completion in
            if let realm = self.realm {
                let favorites: Results<FavoriteEntity> = realm.objects(FavoriteEntity.self)
                completion(.success(favorites.toArray(ofType: FavoriteEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavorite(id: String) -> AnyPublisher<FavoriteEntity, Error> {
        return Future<FavoriteEntity, Error> { completion in
            if let realm = self.realm {
                if let favorite = realm.object(ofType: FavoriteEntity.self, forPrimaryKey: id){
                    completion(.success(favorite))
                } else {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
