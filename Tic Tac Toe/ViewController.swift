//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by etudiant on 04/04/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label: UILabel!
    var activePlayer=1 //Cross
    var scoreXX = 0
     var scoreYY = 0
    var t = 0
    var val = 0
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive=true
    
    @IBOutlet weak var scoreY: UILabel!
    @IBOutlet weak var scoreX: UILabel!
    
    

    @IBOutlet weak var Llabel1: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        
        if(gameState[sender.tag-1] == 0 && gameIsActive == true){
           gameState[sender.tag-1] = activePlayer
        
        if(activePlayer==1){
            sender.setImage(UIImage(named:"croix.jpg"), for: UIControlState())
            activePlayer = 2
            Llabel1.text="O"
            
         
        }else
        {
            sender.setImage(UIImage(named:"cercle.jpg"), for: UIControlState())
            activePlayer = 1
            Llabel1.text="X"
        
        }}
        
        for combination in winningCombination{
          
            if gameState[combination[0]] != 0 && gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    // croix has won
                    
                    label.text="les X ont gagné"
                    scoreXX += 1
             
                    scoreX.text=String(scoreXX)
                    for i in 1...9{
                        let button = view.viewWithTag(i) as! UIButton
                        button.setImage(nil, for: UIControlState())}
                 
                }else{
                    
                    label.text="les O ont gagné" 
                    scoreYY += 1
                   
                    scoreY.text=String(scoreYY)
                    for i in 1...9{
                        let button = view.viewWithTag(i) as! UIButton
                        button.setImage(nil, for: UIControlState())}
                    
                    
                }
                playAgainButton.isHidden = false
                label.isHidden=false
      
            }}
        gameIsActive=false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive=true
                break
            }
        }
        if gameIsActive == false
        {
            label.text = "Egalité"
      
            scoreY.text=String(scoreYY)
            scoreX.text=String(scoreXX)
            label.isHidden=false
            playAgainButton.isHidden = false
        }
    }
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive=true
        activePlayer = 1
        val+=1
        if (val==3){
            createAlert(title: "FIN DE LA PARTIE ", message: "Vous voulez enregistrer votre score?")
            playAgainButton.setTitle("Enregistrer", for: .normal)
            
            
            
        }
        playAgainButton.isHidden = false
        label.isHidden=false
        scoreX.isHidden=false
        scoreY.isHidden=false
        Llabel1.text = "X"
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
            
        }
    }

  
    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Yes", style: UIAlertActionStyle.default, handler:{
            (action) in alert.dismiss(animated: true, completion: nil)
            print("YES")
        }))
        alert.addAction(UIAlertAction(title:"No", style: UIAlertActionStyle.default, handler:{
            (action) in alert.dismiss(animated: true, completion: nil)
            print("NO")
        }))
        self.present(alert, animated: true, completion: nil)    }
    
    
    @IBAction func enter(_ sender:AnyObject) {
        if(scoreX.text != ""){
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let DestViewController = segue.destination as! SecondViewController
        if(scoreXX>scoreYY){
            DestViewController.labelText = scoreX.text!
            DestViewController.labelText1 = label.text!
        }
        else{
            DestViewController.labelText = scoreY.text!
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreX.text=String(scoreXX)
        scoreY.text=String(scoreYY)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
