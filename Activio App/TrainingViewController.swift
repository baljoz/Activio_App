//
//  TrainingViewController.swift
//  Activio App
//
//  Created by Milos Stosic on 5/12/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
 {

    var playerName = [String]()
    var playerSurname = [String]()
    var playerImages = [UIImage] ()
    var playerPosition = [String]()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerImages.append(UIImage(named: "1")!)
        playerPosition.append("quoterback")
        playerName .append(("Igor"))
        playerSurname.append("Stosic")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainingCell", for: indexPath) as! TraningPlayerTableViewCell
        
        cell.playerName.text = playerName[0]
        cell.playerSurname.text = playerSurname [0]
        cell.playerPosition.text = playerPosition[0]
        cell.playerImage.image = playerImages[0]
        cell.pear.tag = indexPath.row
        
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
