//
//  ViewController.swift
//  assignment1
//
//  Created by 肖玥 on 10/1/20.
//  Copyright © 2020 yuexiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var headTitle: UILabel!
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player1Left: UIImageView!
    @IBOutlet weak var player1Middle: UIImageView!
    @IBOutlet weak var player1Right: UIImageView!
    
    
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player2Left: UIImageView!
    @IBOutlet weak var player2Middle: UIImageView!
    @IBOutlet weak var player2Right: UIImageView!
    
    @IBOutlet weak var winnerName: UILabel!
    
    var cardNumber = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    var cardFlower = ["C","D","H","S"]
    var card:pokerCard?
    var cardArray = [pokerCard(number: 1, flower: "C",imageName:"1C")]
    var player1LeftInt = 0
    var player1MiddleInt = 0
    var player1RightInt = 0
    var player2LeftInt = 0
    var player2MiddleInt = 0
    var player2RightInt = 0
    var beginToPlay = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        
        // play the game
        headTitle.text = "Who got the Ace"
        
        cardArray = getPoke()
        cardArray.shuffle()
        
        player1LeftInt = Int.random(in: 0...cardArray.count - 1)
        player1MiddleInt = Int.random(in: 0...cardArray.count - 1)
        player1RightInt = Int.random(in: 0...cardArray.count - 1)
        player2LeftInt = Int.random(in: 0...cardArray.count - 1)
        player2MiddleInt = Int.random(in: 0...cardArray.count - 1)
        player2RightInt = Int.random(in: 0...cardArray.count - 1)
       
        player1Left.image = UIImage(named: cardArray[player1LeftInt].imageName)
        player1Middle.image = UIImage(named: cardArray[player1MiddleInt].imageName)
        player1Right.image = UIImage(named: cardArray[player1RightInt].imageName)
        player2Left.image = UIImage(named: cardArray[player2LeftInt].imageName)
        player2Middle.image = UIImage(named: cardArray[player2MiddleInt].imageName)
        player2Right.image = UIImage(named: cardArray[player2RightInt].imageName)
        
        //show the name of winner
        if(cardArray[player1LeftInt].number == 1 || cardArray[player1MiddleInt].number == 1 || cardArray[player1RightInt].number == 1) {
            winnerName.text = "Player1 WIN!"
        } else if (cardArray[player2LeftInt].number == 1 || cardArray[player2MiddleInt].number == 1 || cardArray[player2RightInt].number == 1) {
            winnerName.text = "Player2 WIN!"
        } else {
            winnerName.text = "No Winner"
        }
        
        // play again or not
        let controller = UIAlertController(title: title, message: "Play again?", preferredStyle:.alert)
        
        
    }
    
    
    func getPoke() -> [pokerCard] {
                  for i in 1...cardNumber.count{
                      for j in 1...cardFlower.count{
                          card = pokerCard(number: cardNumber[i-1], flower: cardFlower[j-1],imageName:"\(cardNumber[i-1])\(cardFlower[j-1])")
                          if let card = card{
                              cardArray += [card]
                          }
                      }
                  }
                  cardArray.removeFirst()
                  return cardArray
              }
    
    
    
    
    

}

