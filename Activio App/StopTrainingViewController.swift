//
//  StopTrainingViewController.swift
//  Activio App
//
//  Created by Milos Stosic on 5/12/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class StopTrainingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopTrainingCell", for: indexPath) as! StopTrainingTableViewCell
        
        cell.playerName.text = "Igor"
        cell.playerSurname.text = "Stosic"
        cell.playerPosition.text = "QB"
        cell.playerImage.image = UIImage(named: "1")
    //    cell.progresPlayer.progress = 50
        var p = Float(arc4random_uniform(UInt32(100)))
        let	 g = Int(p)
        p=p/100
        cell.progresPlayer.setProgress(p, animated: true)
        cell.progresPlayer.isHidden=false
        cell.progresText.text = String(g)
        
        return cell
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
