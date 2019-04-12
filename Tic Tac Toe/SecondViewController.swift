//
//  SecondViewController.swift
//  Tic Tac Toe
//
//  Created by etudiant on 10/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    


    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labell: UILabel!
    var labelText = String()
    var labelText1 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labell.text = labelText
        label1.text = labelText1
    
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
