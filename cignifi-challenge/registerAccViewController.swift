//
//  registerAccViewController.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 27/04/22.
//

import UIKit
import Firebase

class registerAccViewController: UIViewController {

    @IBOutlet weak var emailRegisterViewField: UITextField!
    @IBOutlet weak var passwordRegisterViewField: UITextField!
    @IBOutlet weak var confirmPasswordViewField: UITextField!
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var backgroundRegisterEmail: UIView!
    @IBOutlet weak var backgroundRegisterPassword: UIView!
    @IBOutlet weak var backgroundRegisterConfirm: UIView!
    @IBOutlet weak var googleRegisterView: UIView!
    @IBOutlet weak var facebookRegisterView: UIView!
    @IBOutlet weak var twitterRegisterView: UIView!
    @IBOutlet weak var lblPasswordValidation: UILabel!
    
    var auth:Auth?
    var isPasswordValid = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()

        buttonSignup.layer.cornerRadius = 6
        buttonSignup.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        buttonSignup.layer.shadowOffset = CGSize(width: 1, height: 2)
        buttonSignup.layer.shadowOpacity = 1.0
        buttonSignup.layer.shadowRadius = 6
        buttonSignup.layer.masksToBounds = false
        
        applyBorderAndShadow(myView: backgroundRegisterEmail)
        applyBorderAndShadow(myView: backgroundRegisterConfirm)
        applyBorderAndShadow(myView: backgroundRegisterPassword)
        applyBorderAndShadow(myView: googleRegisterView)
        applyBorderAndShadow(myView: facebookRegisterView)
        applyBorderAndShadow(myView: twitterRegisterView)
    }
    
    func applyBorderAndShadow(myView: UIView) {
        myView.layer.cornerRadius = 6
        myView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        myView.layer.shadowOffset = CGSize(width: 1, height: 1)
        myView.layer.shadowOpacity = 1.0
        myView.layer.shadowRadius = 6
        myView.layer.masksToBounds = false
    }
    
    func alert(title:String, message:String){
        
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert )
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
      let email:String = self.emailRegisterViewField.text ?? ""
        let password:String = self.passwordRegisterViewField.text ?? ""
        let confirmpass:String = self.confirmPasswordViewField.text ?? ""
        
        if password == confirmpass {
            
            self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
                
                if error != nil{
                    self.emailRegisterViewField.text = ""
                    self.passwordRegisterViewField.text = ""
                    self.confirmPasswordViewField.text = ""
                    
        
                }else{
                    self.alert(title: "All right!!!", message: "Success to Register!!!")
                }
            })
        }else{
            self.alert(title: "Attention!!!", message: "The Password is not Same!!!")
        }
    }
}
