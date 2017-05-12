//
//  SelectTeamViewController.swift
//  Activio App
//
//  Created by Milos Stosic on 5/12/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class SelectTeamViewController: UIViewController {

    @IBOutlet weak var selectTeamButton: DropMenuButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectTeamButton.initMenu(["Team 1", "Team 2", "Team 3"], actions: [({ () -> (Void) in
            print("Team 1")
        }), ({ () -> (Void) in
            print("Team 2")
        }), ({ () -> (Void) in
            print("Team 3")
        })])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectTeam(_ sender: Any) {
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
