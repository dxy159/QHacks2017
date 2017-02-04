//
//  ViewController.swift
//  QHacks2017
//
//  Created by Richard Ni on 2017-02-03.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Main Controller
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(gesture:)))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "login") {
            
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

