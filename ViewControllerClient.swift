//
//  ViewControllerClient.swift
//  QHacks2017
//
//  Created by Behshad Hosseini on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit

var points = Int()

class ViewControllerClient: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var medication: UITableView!
    
    var em = String()
    var pw = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prescriptionList.add(medicineName: "Dank Herb", description: "The dank herb", timesPerDay: 5, hoursInBetween: 10)
        
        points = 100
        info.text = "Your points: \(points)"
        
        var timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(ViewControllerClient.sendAlert), userInfo: nil, repeats: true)
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
        cell.detailTextLabel?.text = "This must be taken every 10 seconds."
        
        return cell
        
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
    
    func sendAlert() {
        let alert = UIAlertController(title: "Time to take your meds!", message: "The dank herb.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Took it", style: .default, handler: { (action: UIAlertAction!) in
            points += 100
            self.info.text = "Your points: \(points)"
            }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
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
