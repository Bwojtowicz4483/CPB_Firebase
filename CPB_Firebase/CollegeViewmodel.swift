//
//  CollegeViewmodel.swift
//  CPB_Firebase
//
//  Created by Ben Wojtowicz on 11/20/23.
//

import Foundation
import FirebaseDatabaseSwift
import FirebaseDatabase

class CollegeViewmodel: ObservableObject{
    @Published var colleges: [College] = []
    
    init() {
      pullFromFirebase()
    }
    
    func AddCollege(currentCollege: College) {
        colleges.append(currentCollege)
        AddToFirebse(college: currentCollege)
    }
    
    func AddToFirebse(college:College) {
        let database = Database.database().reference()
        let dataRef = database.child("colleges").child("\(college.name)")
        dataRef.child("name").setValue(college.name)
        dataRef.child("location").setValue(college.location)
        dataRef.child("students").setValue(college.students)
        dataRef.child("url").setValue(college.url)
        
    }
    
    func pullFromFirebase() {
        let  databaseRef =  Database.database().reference().child("colleges")
        databaseRef.getData {myError, myDataSnapshot in
            var newList: [College] = []
            for college  in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let nameOfCollege = college.key
                let dictionary = task.value as! [String:String]
                guard let locationOfCollege = dictionary["Location"] else { return }
                guard let numberOfStudents = dictionary["Students"] else { return }
                guard let urlOfCollege = dictionary["URL"] else { return }
                    
                let  currentCollege = College(name: nameOfCollege, location: locationOfCollege, students: numberOfStudents, url: urlOfCollege)
                newList.append(currentCollege)
                }
            self.colleges = newList
            }
        }
        
    }

