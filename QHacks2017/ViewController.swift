//
//  ViewController.swift
//  QHacks2017
//
//  Created by Richard Ni on 2017-02-03.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //Main Controller
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
        prescriptionList.removeLast()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //var JSON:JSONEncoding
    
    func httpCall() {
        let parameters: Parameters = [
            "email": email.text!
        ]
        
        // All three of these calls are equivalent
        Alamofire.request("http://localhost:3000/api/v1/client_infos.json", method: .get, parameters: parameters).responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            //JSON = response.result
            
            //            if let JSON = response.result.value {
            //                print("JSON: \(JSON)")
            //            }
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "login") {
            httpCall()
            
            if let client = segue.destination as? ViewControllerClient {
            
                if ((email.text == "") || (password.text == "")) {
                
                    let alert = UIAlertController(title: "Login Failed", message: "Please provide valid health information.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    
                    present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    client.em = email.text!
                    client.pw = password.text!
                    
                }
                
            }
            
        }
        
    }
    
    
    func tap(gesture: UITapGestureRecognizer) {
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    

}

