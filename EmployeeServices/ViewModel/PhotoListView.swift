//
//  ContentView.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import SwiftUI

enum ImagePickerViewMode {
    case library
    case camera
}

struct PhotoListView: View {
    @ObservedObject var viewModel = PhotoListViewModel()
    @State private var showingAlert = false
    @State private var isImagePickerPresented = false
    @State private var pickerMode = UIImagePickerController.SourceType.photoLibrary
    @State private var selectedEmployee: Employee?
    
    var body: some View {
        NavigationView {
            List(viewModel.employees) { employee in
                Button(action: {
                    self.showingAlert = true
                    self.selectedEmployee = employee
                }) {
                    PhotoRow(employee: employee, photo: self.viewModel.fetchPhotoForEmployee(employeeID: employee.id))
                }
            }
            .navigationBarTitle(Text("Employees"))
        }
        .onAppear {
            self.viewModel.fetchEmployees()
        }
        .listStyle(GroupedListStyle())
        .actionSheet(isPresented: $showingAlert) {
            ActionSheet(title: Text("Change Profile Picture"),
                        message: nil,
                        buttons: [
                            .default(
                                Text("Take a Photo"),
                                action: {
                                    self.isImagePickerPresented = true
                                    self.pickerMode = (UIImagePickerController.isSourceTypeAvailable(.camera)) ? .camera : .photoLibrary
                            }),
                            .default(
                                Text("Choose a Photo"),
                                action: {
                                    self.isImagePickerPresented = true
                                    self.pickerMode = .photoLibrary
                            }), .cancel()])
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerView(sourceType: self.pickerMode) { image in
                self.viewModel.savePhotoForEmployee(employeeID: self.selectedEmployee?.id ?? "", image: image)
                self.selectedEmployee = nil
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var view = PhotoListView()
        view.viewModel = PhotoListViewModel()
        return view
    }
}
