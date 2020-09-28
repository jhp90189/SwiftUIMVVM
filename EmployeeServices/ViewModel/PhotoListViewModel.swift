//
//  PhotoListViewModel.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol PhotoListViewModelProtocol {
    var employees: [Employee] { get }
    var fetchInProgress: Bool { get }
    func fetchEmployees()
    func fetchPhotoForEmployee(employeeID: String) -> UIImage
    func savePhotoForEmployee(employeeID: String, image: UIImage)
}

// Viewmodel class which acts as a mediator between data manager and view
final class PhotoListViewModel: ObservableObject {
    @Published var employees = [Employee]()
    @Published var fetchInProgress: Bool = false
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager()) {
        self.dataManager = dataManager
        fetchEmployees()
    }
}

extension PhotoListViewModel: PhotoListViewModelProtocol {
    
    func fetchPhotoForEmployee(employeeID: String) -> UIImage {
        return dataManager.fetchPhotoForEmployee(employeeID: employeeID) ?? UIImage()
    }
    
    func savePhotoForEmployee(employeeID: String, image: UIImage) {
        dataManager.addPhotoForEmployee(employeeID: employeeID, image: image)
    }
    
    func fetchEmployees() {
        fetchInProgress = true
        dataManager.fetchEmployees { [weak self] result in
            switch result {
            case .success(let response):
                self?.employees = response.data
            case .failure(_):
                self?.employees = []
            }
            self?.fetchInProgress = false
        }
    }
}
