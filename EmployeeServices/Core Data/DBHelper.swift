//
//  DBHelper.swift
//  DBHelper
//
//  Created by Alex Zarr on 2020-02-24.
//  Copyright © 2020 alexzarr. All rights reserved.
//

import Foundation

 protocol DBHelperProtocol {
    associatedtype ObjectType
    associatedtype PredicateType
    
    func create(_ object: ObjectType)
    func fetchFirst(_ objectType: ObjectType.Type, predicate: PredicateType?) -> Result<ObjectType?>
    func fetch(_ objectType: ObjectType.Type, predicate: PredicateType?, limit: Int?) -> Result<[ObjectType]>
    func update(_ object: ObjectType)
    func delete(_ object: ObjectType)
}

 extension DBHelperProtocol {
    func fetch(_ objectType: ObjectType.Type, predicate: PredicateType? = nil, limit: Int? = nil) -> Result<[ObjectType]> {
        return fetch(objectType, predicate: predicate, limit: limit)
    }
}
