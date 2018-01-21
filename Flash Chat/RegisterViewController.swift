//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        //TODO: Set up a new user on our Firbase database
        //Asynchronous action!
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            
            (user, error) in // indication of within (trailing) closure
            if error != nil {
               print(error!)
            } else {
                print("Registration successful!")
                //performSegue is a UIViewController method common to other derived classes
                //but becuase now we are in a closure, we have to add "self." to the front of performSegue method call
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
//        GoogleAuthProvider.credential(withIDToken: <#T##String#>, accessToken: <#T##String#>)
        
    
        
    } 
    
    
}
