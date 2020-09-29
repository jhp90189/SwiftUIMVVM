//
//  EmployeeAPIServices.swift
//  EmployeeServices
//
//  Created by Apple on 28/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation

//EmployeeAPIServ1ces c ass
// conf1·gure endpoint to make service calls
class EmployeeAPIServices {
    
    private let apiClient = APIClient()
    private let baseURL = "http://dummy.restapiexample.com/api/v1/"
    private var getEmployeesURL : String {
        return baseURL + "employees"
    }
    private let shouldUseStubData = true
    //API call to fetch list of employees
    func fetchEmployees(completion: @escaping ((Result<EmployeeServiceResponse>) -> Void)) {
        if shouldUseStubData {
            do {
                if let filePath = Bundle.main.path(forResource: "service", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                    let items = try JSONDecoder().decode(EmployeeServiceResponse.self, from: data)
                    completion(.success(items))
                }
            } catch {}
        } else {
            guard let employeeURL = URL(string: getEmployeesURL) else { return }
            let resourse = Resource(url: employeeURL)
            apiClient.load(resourse) { result in
                switch result {
                case . success(let data):
                    do {
                        let items = try JSONDecoder().decode(EmployeeServiceResponse.self, from: data)
                        completion(.success(items))
                        
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
