//
//  ContentView.swift
//  EmployeeServices
//
//  Created by Apple on 26/09/20.
//  Copyright © 2020 Rajesh Sammita. All rights reserved.
//

import SwiftUI

struct PhotoListView: View {
    @ObservedObject var viewModel = PhotoListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.employees) { employee in
                Button(action: {
                }) {
                    PhotoRow(employee: employee)
                }
            }
            .navigationBarTitle(Text("Employees"))
        }
        .onAppear {
            self.viewModel.fetchEmployees()
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
