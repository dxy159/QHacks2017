//
//  medicine.swift
//  QHacks2017
//
//  Created by Richard Ni on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import Foundation

var prescriptionList = PrescriptionList()

struct Prescription {
    
    var medicineName: String
    var description: String
    var timesPerDay: Int
    var hoursInBetween: Int
    
}

class PrescriptionList {

    var id = String()
    var prescriptions = [Prescription]()
    
    func add(medicineName: String, description: String, timesPerDay: Int, hoursInBetween: Int) {
        prescriptions.append(Prescription(medicineName: medicineName, description: description, timesPerDay: timesPerDay, hoursInBetween: hoursInBetween))
    }
    
    func removeLast() {
        if prescriptions.count <= 0 {
            return
        } else {
            prescriptions.remove(at: prescriptions.count - 1)
        }
    }

}
