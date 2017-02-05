//
//  ViewControllerSignUp.swift
//  QHacks2017
//
//  Created by Richard Ni on 2017-02-04.
//  Copyright © 2017 Richard Ni. All rights reserved.
//

import UIKit
import Alamofire

class ViewControllerSignUp: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var clientName: UITextField!
    @IBOutlet weak var healthNumber: UITextField!
    
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
    func httpCall() {
    let parameters: Parameters = [
        "name": clientName.text!,
        "email":email.text!,
        "number_id":healthNumber.text!,
        "password": password.text
    ]
    
    // All three of these calls are equivalent
    Alamofire.request("https://quiet-ravine-61683.herokuapp.com/api/v1/client_infos.json", method: .post, parameters: parameters).responseJSON { response in
    print(response.request)  // original URL request
    print(response.response) // HTTP URL response
    print(response.data)     // server data
    print(response.result)   // result of response serialization
    
    //            if let JSON = response.result.value {
    //                print("JSON: \(JSON)")
    //            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "signup" {
            
            if ((email.text == "") || (password.text == "") || (confirmPassword.text == "") || (clientName.text == "") || (healthNumber.text == "")) {
                
                let alert = UIAlertController(title: "Login Failed", message: "You left the fields blank.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
            } else if (password.text != confirmPassword.text) {
                
                let alert = UIAlertController(title: "Login Failed", message: "Passwords don't match.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
            } else {
                
                httpCall()
                
//                httpPost(email: email.text!, password: password.text!, name: clientName.text!, healthID: healthNumber.text!)
                
            }
            
        }
        
    }
    
    
    
    
//    func httpPost(email: String, password: String, name: String, healthID: String) {
//        
//        //{"name":"anthony","email":"anthony@gmail.com","number_id":"123","password":"123"}
//        let json = ["name":name,"email":email,"number_id":healthID,"password":password]
//        
//        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [])
//        print(name, email, healthID, password)
//        
//        // Create POST request
//        let url = URL(string: "https://quiet-ravine-61683.herokuapp.com/api/v1/client_infos.json")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        
//        // Insert json into body
//        request.httpBody = jsonData
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print(error?.localizedDescription ?? "No data")
//                return
//            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let responseJSON = responseJSON as? [String: Any] {
//                print(responseJSON)
//            }
//        }
//        
//        task.resume()
//        
//    }
    
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
