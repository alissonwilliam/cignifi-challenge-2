//
//  LoginViewController.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 26/04/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backgroundViewEmail: UIView!
    @IBOutlet weak var backgroundPassword: UIView!
    @IBOutlet weak var googleLoginView: UIView!
    @IBOutlet weak var facebookLoginView: UIView!
    @IBOutlet weak var twitterLoginView: UIView!
    
    var auth:Auth?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        
        
        loginButton.layer.cornerRadius = 6 //BORDA BOTAO
        loginButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor //SOMBRA DO BOTAO
        loginButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        loginButton.layer.shadowOpacity = 1.0
        loginButton.layer.shadowRadius = 6
        loginButton.layer.masksToBounds = false
        // PARA COLOCAR SOMBRA E UM TEXT FIELD E NECESSARIO COLOCAR DENTRO DE UMA UIVIEW
        applyBorderAndShadow(myView: backgroundViewEmail)
        applyBorderAndShadow(myView: backgroundPassword)
        applyBorderAndShadow(myView: googleLoginView)
        applyBorderAndShadow(myView: facebookLoginView)
        applyBorderAndShadow(myView: twitterLoginView)
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
    
    
    @IBAction func loginButtonSignin(_ sender: UIButton) {
                
        
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password, completion: { (usuario, error) in
            
            if error != nil{
                
                self.alert(title: "Attention!", message: "Incorrect data information!")
            }else{
                
                if usuario == nil{
                    
                    self.alert(title: "Attention!", message: "Unexpected problem!")
                }else{
                    //self.alert(title: "All Right!", message: "Success login!!!")
                    self.performSegue(withIdentifier: "SecondScreen", sender: nil)
                    
                }
            
            }
        })
        emailTextField.text = ""
        passwordTextField.text = ""
}
    
    @IBAction func signupButtonLogin(_ sender: UIButton) {
        
    }
}

//continuar
