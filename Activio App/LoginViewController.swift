//
//  LoginViewController.swift
//  Activio App
//
//  Created by Milos Stosic on 5/12/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var rememberButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    var isCheckedRemember = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickRemember(_ sender: Any) {
        
        if isCheckedRemember
        {
             rememberButton.setImage(nil, for: UIControlState.normal)
            isCheckedRemember = false
        }
        else
        {
             rememberButton.setImage(UIImage(named: "Checked"), for: UIControlState.normal)
            isCheckedRemember = true
        }
        
                }

    
    override func viewDidAppear(_ animated: Bool) {
        let user = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        let pass = UserDefaults.standard.object(forKey: "password") as? String ?? ""
        let check = UserDefaults.standard.object(forKey: "remember") as? Bool ?? false
        username.text=user
        password.text=pass
        isCheckedRemember = check
        if isCheckedRemember
        {
            rememberButton.setImage(UIImage(named: "Checked"), for: UIControlState.normal)
        }
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        
        if isCheckedRemember
        {
            UserDefaults.standard.set(username.text, forKey: "username")
            UserDefaults.standard.set(password.text, forKey: "password")
            UserDefaults.standard.set(isCheckedRemember, forKey: "remember")
        }
        else
        {
            UserDefaults.standard.set("", forKey: "username")
            UserDefaults.standard.set("", forKey: "password")
            UserDefaults.standard.set(false ,forKey: "remember")
        }

    }
    
    
}
