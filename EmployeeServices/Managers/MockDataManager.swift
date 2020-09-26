//
//  MockDataManager.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation
import SwiftUI

class MockDataManager {
    
    private var employees = [Employee]()
    
    init() {
        employees = [
            Employee(id: "2", name: "Nick Taylor", profilePicture: UIImage(systemName: "photo")!),
            Employee(id: "12", name: "Rajesh Sammita", profilePicture: UIImage(systemName: "photo")!),
            Employee(id: "20", name: "Doris Wilder", profilePicture: UIImage(systemName: "photo")!)
        ]
    }
}

extension MockDataManager: DataManagerProtocol {
    func fetchEmployees() -> [Employee] {
        return employees
    }
}
