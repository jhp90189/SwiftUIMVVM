//
//  Photo.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation
import SwiftUI

struct Photo: Identifiable {
    var id = UUID()
    var content : Image
    var employeeID: String
}
