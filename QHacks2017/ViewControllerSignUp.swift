//
//  ViewControllerSignUp.swift
//  QHacks2017
//
//  Created by Richard Ni on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit

class ViewControllerSignUp: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewControllerSignUp.tap(gesture:)))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "signup" {
            
            if ((email.text == "") || (password.text == "") || (confirmPassword.text == "")) {
                
                let alert = UIAlertController(title: "Login Failed", message: "You left the fields blank.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
            } else if (password.text != confirmPassword.text) {
                
                let alert = UIAlertController(title: "Login Failed", message: "Passwords don't match.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
            } 
            
        }
        
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirmPassword.resignFirstResponder()
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
