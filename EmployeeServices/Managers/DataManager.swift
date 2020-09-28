//
//  DataManager.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import Foundation
import SwiftUI

protocol DataManagerProtocol {
    func fetchEmployees(completion: @escaping ((Result<EmployeeServiceResponse>) -> Void))
    func fetchPhotoForEmployee(employeeID: String) -> UIImage?
    func addPhotoForEmployee(employeeID: String, image: UIImage)
}

class DataManager {
    static let shared = DataManager()
    var dbHelper: CoreDataHelper = CoreDataHelper.shared
    
    func getImageFromName(name: String) -> UIImage? {
        guard let cacheDirectory = pathForCacheDirectory() else { return nil }
        let filePath = cacheDirectory + "/" + name
        if FileManager.default.fileExists(atPath: filePath) {
            return UIImage(contentsOfFile: filePath)
        }
        return nil
    }
    
    func saveImageWithName(employeeID: String, image: UIImage) -> String {
        guard let cacheDirectory = pathForCacheDirectory() else { return "" }
        let fileName = employeeID + ".png"
        let filePath = cacheDirectory + "/" + fileName
        let isSaved = FileManager.default.createFile(atPath: filePath, contents: image.pngData(), attributes: nil)
        return isSaved ? fileName : ""
    }
    
    func pathForCacheDirectory() -> String? {
        NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    }
}

extension DataManager: DataManagerProtocol {
    func fetchEmployees(completion: @escaping ((Result<EmployeeServiceResponse>) -> Void)) {
        let employeeService = EmployeeAPIServices()
        employeeService.fetchEmployees { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    func fetchPhotoForEmployee(employeeID: String) -> UIImage? {
        let predicate = NSPredicate(format: "employeeID == \(employeeID)")
        let result = dbHelper.fetchFirst(Photo.self, predicate: predicate)
        switch result {
        case .success(let photo):
            return getImageFromName(name: photo?.fileName ?? "")
        default:
            return nil
        }
    }
    
    func addPhotoForEmployee(employeeID: String, image: UIImage) {
        let fileName = saveImageWithName(employeeID: employeeID, image: image)
        if !fileName.isEmpty {
            let entity = Photo.entity()
            let newPhoto = Photo(entity: entity, insertInto: dbHelper.context)
            newPhoto.employeeID = employeeID
            newPhoto.fileName = fileName
            dbHelper.create(newPhoto)
        }
    }
}
