//
//  ViewControllerClient.swift
//  QHacks2017
//
//  Created by Behshad Hosseini on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit

class ViewControllerClient: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var medication: UITableView!
    
    var em = String()
    var pw = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        info.text = "Em: \(em), Pw: \(pw)"
        prescriptionList.add(medicineName: "Dank Herb", description: "The dank herb", timesPerDay: 5, hoursInBetween: 3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Handle table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptionList.prescriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Default")
        
        cell.textLabel?.text = prescriptionList.prescriptions[indexPath.row].medicineName
        cell.detailTextLabel?.text = prescriptionList.prescriptions[indexPath.row].description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        print("Row: \(row)")
        print("Medicine: \(prescriptionList.prescriptions[row].medicineName)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "logout" {
            
            if let main = segue.destination as? ViewController {
            
                let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                    self.present(main, animated: true, completion: nil)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                present(alert, animated: true, completion: nil)
                
            }
            
        }
        
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
