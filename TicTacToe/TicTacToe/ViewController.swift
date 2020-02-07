//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aditya Ramaakrushnan on 1/31/20.
//  Copyright © 2020 Aditya Ramaakrushnan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ticTacToeBrain = Brain()
    @IBOutlet weak var display: UILabel!
    
    @IBAction func TouchButton(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
        print(buttonPressed)
        if sender.currentTitle! == "X" || sender.currentTitle! == "O"{
            display.text = "That spot is taken"
        }
        else{
            ticTacToeBrain.takeTurn(coordinates: sender.currentTitle!)

            let playerSprite = ticTacToeBrain.updateView()
            sender.setTitle(playerSprite, for: UIControl.State.normal)
            sender.setTitleColor(UIColor.black,for: UIControl.State.normal)
            
            if ticTacToeBrain.isThereAWinner(){
                display.text = "\(ticTacToeBrain.updateView()) has won"
            }
            else{
            ticTacToeBrain.nextPlayer()
            display.text = "It is now Player \(ticTacToeBrain.Sprites[ticTacToeBrain.whoIsPlayer()])'s turn"
            }
        }
    }
}

