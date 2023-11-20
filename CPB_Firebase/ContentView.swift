//
//  ContentView.swift
//  CPB_Firebase
//
//  Created by Ben Wojtowicz on 11/20/23.
//

import SwiftUI
import FirebaseDatabaseSwift
import FirebaseDatabase

struct ContentView: View {
    @ObservedObject var viewModel = CollegeViewmodel()
    @State var collegeName = ""
    @State var collegeLocation = ""
    @State var collegeStudents = ""
    @State var collegeUrl = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(viewModel.colleges,id:\.self){ currentCollege in
                    Text(currentCollege.name)
                        .bold()
                    Text(currentCollege.location)
                                }
            }
            
            
                .alert("Please answer the following questions", isPresented: $showingAlert) {
                    TextField("Name of the college?", text: $collegeName)
                    TextField("Location of the college?", text: $collegeLocation)
                    TextField("How many st udents attend?", text: $collegeStudents)
                    TextField("Does it have a website?", text: $collegeUrl)
                    Button(action: {
                        let newCollege = College(name: collegeName, location: collegeLocation, students: collegeStudents, url: collegeUrl)
                        viewModel.AddCollege(currentCollege: newCollege)
                        collegeName = ""
                        collegeLocation = ""
                        collegeStudents = ""
                        collegeUrl = ""
                        showingAlert = false
                    }) {
                        Text("Submit")
                    }
                }
            Button("+") {
               showingAlert = true
            }
            .frame(width: 300, height: 100)
            .background(.blue)
            .foregroundColor(.white)
            .padding()
            
            
            
            .navigationTitle("CPB_Firebase")
                }
            }
        }
    #Preview {
        ContentView()
    }
