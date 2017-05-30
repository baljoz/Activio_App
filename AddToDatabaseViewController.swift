//
//  AddToDatabaseViewController.swift
//  Activio App
//
//  Created by Milos Stosic on 5/15/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class AddToDatabaseViewController: UIViewController {

    @IBOutlet weak var pozicija: UITextField!
    @IBOutlet weak var goidne: UITextField!
    @IBOutlet weak var prezime: UITextField!
    @IBOutlet weak var ime: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var add: UIButton!

    @IBAction func addTodatabase(_ sender: Any) {
        var image = UIImage(named: "1")
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
       let writePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("1.jpg")
     //   UIImageJPEGRepresentation(image!,1.0).writeToFile(writePath, atomically: true)
            
        let name = ime.text
        let prez = prezime.text
        let posi = pozicija.text
        let god = goidne.text
        let p =  Int(god!)
        SQLDataIO.addPlayer( name: name!,surname: prez!,position: posi!,godine: p!)
        
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
