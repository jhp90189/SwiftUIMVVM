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
            Employee(id: "2", employee_name: "Nick Taylor"),
            Employee(id: "12", employee_name: "Rajesh Sammita"),
            Employee(id: "20", employee_name: "Doris Wilder")
        ]
    }
}

extension MockDataManager: DataManagerProtocol {
    func fetchEmployees(completion: @escaping ((Result<EmployeeServiceResponse>) -> Void)) {
        completion(.success(EmployeeServiceResponse(status: "success", data: employees)))
    }
    
    func fetchPhotoForEmployee(employeeID: String) -> UIImage? {
        return UIImage(systemName: "photo")
    }
    
    func addPhotoForEmployee(employeeID: String, image: UIImage) { }
}
