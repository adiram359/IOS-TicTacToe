//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Aditya Ramaakrushnan on 1/31/20.
//  Copyright © 2020 Aditya Ramaakrushnan. All rights reserved.
//

import Foundation

class Brain{
    //Player 0 is O, Player 1 is X
    
    var Sprites = ["O", "X"]
    var currentPlayer = 0
    var ticTacToeBoard = Array(repeating: Array(repeating: "", count: 3), count: 3)
    var buttonToCoordinates = ["(0,0)":[0,0], "(0,1)":[0,1], "(0,2)":[0,2], "(1,0)":[1,0], "(1,1)": [1,1], "(1,2)":[1,2], "(2,0)":[2,0], "(2,1)":[2,1], "(2,2)":[2,2]]
    
    func takeTurn(coordinates: String){
        let row = buttonToCoordinates[coordinates]![0]
        let column = buttonToCoordinates[coordinates]![1]

        ticTacToeBoard[row][column] = Sprites[currentPlayer]
    }
    
    func isThereAWinner() -> Bool{
       
        let currentPlayer = updateView()
        var diagonal1 = true
        var i = 0
        
        
        while diagonal1 && i < ticTacToeBoard.count{
            if ticTacToeBoard[i][i] == "" || ticTacToeBoard[i][i] != currentPlayer{
                diagonal1 = false
            }
            i = i + 1
        }
        if diagonal1{
            return true
        }
        
        diagonal1 = true
        var row = 2
        var column = 0
        
        while diagonal1 && column < 3{
            if ticTacToeBoard[row][column] == "" || ticTacToeBoard[row][column] != currentPlayer{
                diagonal1 = false
            }
            row = row - 1
            column = column + 1
        }
        if diagonal1{
            return true
        }
        
        for k in 0..<ticTacToeBoard.count{
            var column_k = true
            var row = 0
            while column_k && row < ticTacToeBoard.count{
                if ticTacToeBoard[row][k] == "" || ticTacToeBoard[row][k] != currentPlayer{
                    column_k = false
                }
                row = row + 1
            }
            if column_k{
                return true
            }
        }
        
        for l in 0..<ticTacToeBoard.count{
            var row_k = true
            column = 0
            while row_k && column < ticTacToeBoard.count{
                if ticTacToeBoard[l][column] == "" || ticTacToeBoard[l][column] != currentPlayer{
                    row_k = false
                }
                column = column + 1
            }
            if row_k{
                return true
            }
        }
        return false
    }
    func updateView() -> String {
        return Sprites[currentPlayer]
    }
    
    func whoIsPlayer() -> Int{
        return currentPlayer
    }
    
    func nextPlayer(){
        currentPlayer = (currentPlayer + 1) % 2
    }
    func call(x : Int) -> Int {
        if x == 1{
            return x
        }
        return x + call(x: x - 1)
    }
}


