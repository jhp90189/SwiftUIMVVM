//
//  DataManager.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    func fetchEmployees() -> [Employee]
}

class DataManager {
    static let shared = DataManager()
}
