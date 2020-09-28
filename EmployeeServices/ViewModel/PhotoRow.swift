//
//  PhotoRow.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import SwiftUI

//Photorow is object of a cell in list , represent individual employee view
struct PhotoRow: View {
    var employee: Employee
    var photo: UIImage
    
    var body: some View {
        HStack {
            Image(uiImage: photo)
                .renderingMode(.original)
                .resizable()
                .frame(width: 30, height: 30)
            Text(employee.employee_name)
            Spacer()
        }
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        PhotoRow(employee: Employee(id: "1", employee_name: "jack tylor"), photo: UIImage())
    }
}
