//
//  PhotoListViewModel.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation
import Combine

protocol PhotoListViewModelProtocol {
    var employees: [Employee] { get }
    func fetchEmployees()
}

final class PhotoListViewModel: ObservableObject {
    @Published var employees = [Employee]()
   
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = MockDataManager()) {
        self.dataManager = dataManager
        fetchEmployees()
    }
}

extension PhotoListViewModel: PhotoListViewModelProtocol {
    func fetchEmployees() {
        employees = dataManager.fetchEmployees()
    }
}
