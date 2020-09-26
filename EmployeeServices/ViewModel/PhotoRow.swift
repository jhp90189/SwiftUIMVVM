//
//  PhotoRow.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import SwiftUI

struct PhotoRow: View {
    var employee: Employee
    
    var body: some View {
        HStack { // 1
            Image(uiImage: employee.profilePicture) // 2
                .resizable() // 3
                .frame(width: 20, height: 20) // 4
            Text(employee.name)
            Spacer() // 6
        }
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        PhotoRow(employee: Employee(id: "1", name: "jack tylor", profilePicture: UIImage(systemName: "photo")!))
    }
}
