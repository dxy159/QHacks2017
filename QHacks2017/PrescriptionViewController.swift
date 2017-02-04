//
//  PrescriptionViewController.swift
//  QHacks2017
//
//  Created by Richard Ni on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var doctorDescription: UILabel!
    @IBOutlet weak var timesPerDay: UILabel!
    @IBOutlet weak var hoursInBetween: UILabel!
    
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prescription = prescriptionList.prescriptions[index]
        print(index)
        //name.text = prescription.medicineName
        //doctorDescription.text = prescription.description
        //timesPerDay.text = "Take this \(prescription.timesPerDay) times a day."
        //hoursInBetween.text = "Take this every \(prescription.hoursInBetween) times a day."
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
