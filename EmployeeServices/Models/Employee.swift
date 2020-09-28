//
//  Employee.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation
import SwiftUI

struct Employee: Identifiable, Codable {
    var id: String
    var employee_name: String
}

struct EmployeeServiceResponse: Codable {
    var status: String
    var data: [Employee]
}
