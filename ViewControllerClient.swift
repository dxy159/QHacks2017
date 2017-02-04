//
//  ViewControllerClient.swift
//  QHacks2017
//
//  Created by Behshad Hosseini on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit

class ViewControllerClient: UIViewController {

    @IBOutlet weak var info: UILabel!
    
    var em = String()
    var pw = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        info.text = "Em: \(em), Pw: \(pw)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
