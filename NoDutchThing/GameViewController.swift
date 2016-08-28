//
//  GameViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var playerPositions = [CGPoint(x: CGFloat(60.0), y: CGFloat(410.0)),
                           CGPoint(x: CGFloat(260.0), y: CGFloat(220.0)),
                           CGPoint(x: CGFloat(45.0), y: CGFloat(300.0)),
                           CGPoint(x: CGFloat(120.0), y: CGFloat(120.0)),
                           CGPoint(x: CGFloat(275.0), y: CGFloat(600.0))]
    
    var playerImageNames = ["PlayerVishal",
                            "PlayerHarvey",
                            "PlayerAmanda",
                            "PlayerTami",
                            "PlayerZach"]
    
    var enemyImageView: UIImageView?
    var enemyPosition = CGPoint(x: CGFloat(300.0), y: CGFloat(200.0))
    var enemyVelocity = CGVector(dx: CGFloat(1.5), dy: CGFloat(1.5))
    var enemyAcceleration = CGVector(dx: CGFloat(0.5), dy: CGFloat(0.5))
    var enemyAccelerationDeriv = CGVector(dx: CGFloat(0.5), dy: CGFloat(0.5))
    
    var timer: NSTimer?

    let playerDimension = CGFloat(50.0)
    let enemyDimension = CGFloat(60.0)
    
    let enemyRenderDimension = CGFloat(90.0)
    
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gameBackgroundImageView = UIImageView(image: UIImage(named:"GameBackground"))
        gameBackgroundImageView.frame = self.view.frame
        
        self.view.addSubview(gameBackgroundImageView)
        
        
        
        //self.view.backgroundColor = UIColor.grayColor() //
        
        
        self.positionViews()
        
        

        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0/60.0, target: self, selector: #selector(updatePositions), userInfo: nil, repeats: true)
    }
    
    @objc func updatePositions () {
        /*
        srand(234)
        
        enemyAccelerationDeriv.dx = (self.view.frame.width/2.0 - enemyPosition.x) / CGFloat(10000.0)
        enemyAccelerationDeriv.dy = (self.view.frame.height/2.0 - enemyPosition.y) / CGFloat(10000.0)
        
        enemyAcceleration.dx += enemyAccelerationDeriv.dx
        enemyAcceleration.dy += enemyAccelerationDeriv.dy
        

//        enemyAcceleration.dx = CGFloat(rand() % 100000 - 50000) / CGFloat(300000.0) * (self.view.frame.width/2.0 - enemyPosition.x) / CGFloat(100.0)
//        enemyAcceleration.dy = CGFloat(rand() % 100000 - 50000) / CGFloat(300000.0) * (self.view.frame.height/2.0 - enemyPosition.y) / CGFloat(100.0)

        
        enemyVelocity.dx += enemyAcceleration.dx
        enemyVelocity.dy += enemyAcceleration.dy
        
        if enemyPosition.x > self.view.frame.width - enemyDimension / 2.0 || enemyPosition.x < enemyDimension / 2.0 {
            enemyVelocity.dx = -enemyVelocity.dx
        }
        if enemyPosition.y > self.view.frame.height - enemyDimension / 2.0 || enemyPosition.y < enemyDimension / 2.0 {
            enemyVelocity.dy = -enemyVelocity.dy
        }
        
        enemyPosition.x += enemyVelocity.dx
        enemyPosition.y += enemyVelocity.dy
        
*/
        
        
        counter++

        if enemyPosition.x > self.view.frame.width - enemyDimension / 2.0 || enemyPosition.x < enemyDimension / 2.0 {
            enemyVelocity.dx = -enemyVelocity.dx
        }
        if enemyPosition.y > self.view.frame.height - enemyDimension / 2.0 || enemyPosition.y < enemyDimension / 2.0 {
            enemyVelocity.dy = -enemyVelocity.dy
        }
        
        enemyPosition.x += enemyVelocity.dx
        enemyPosition.y += enemyVelocity.dy
        
        //CGVector perpEnemyVelocity = CGVector(dx: enemyVelocity.dy, dy: enemyVelocity.dx)
        
        

        
        
        
        let num = 200
        let angle = CGFloat(counter % (num+1)) / CGFloat(num) * CGFloat(2*M_PI)
        
        let mag = CGFloat(80.0)
        
        let enemyPositionPrime = CGPoint(x: enemyPosition.x + mag*cos(angle), y: enemyPosition.y + mag*sin(angle))
        
        
        //enemyView!.frame = CGRect(x: enemyPosition.x - enemyDimension / 2.0, y: enemyPosition.y - enemyDimension / 2.0, width: enemyDimension, height: enemyDimension)
        
        //enemyView = UIImageView()
        //enemyView!.backgroundColor = UIColor.redColor()
        //self.view.addSubview(enemyView!)
        
        enemyImageView!.frame = CGRect(x: enemyPositionPrime.x - enemyRenderDimension / 2.0, y: enemyPositionPrime.y - enemyRenderDimension / 2.0, width: enemyRenderDimension, height: enemyRenderDimension)
        
        
        // Collision Check
        
        for pos in playerPositions {
            if fabs(pos.x - enemyPositionPrime.x) < playerDimension / CGFloat(2.0) &&
                fabs(pos.y - enemyPositionPrime.y) < playerDimension / CGFloat(2.0) {
                
                timer?.invalidate()
                timer = nil
                
                self.gameOver()
            }
        }
    }
    
    func positionViews() {
        var i: Int = 0
        for pos in playerPositions {
            let playerView = UIImageView(frame: CGRect(x: pos.x - playerDimension / 2.0, y: pos.y - playerDimension / 2.0, width: playerDimension, height: playerDimension))
            playerView.image = UIImage(named: playerImageNames[i])
            //playerView.backgroundColor = UIColor.greenColor() //
            self.view.addSubview(playerView)
            i++
        }
        
        
        
        enemyImageView = UIImageView(frame: CGRect(x: enemyPosition.x - enemyRenderDimension / 2.0, y: enemyPosition.y - enemyRenderDimension / 2.0, width: enemyRenderDimension, height: enemyRenderDimension))
        enemyImageView!.image = UIImage(named: "Enemy")
        //enemyImageView!.backgroundColor = UIColor.redColor() //
        self.view.addSubview(enemyImageView!)
        
        
    }
    
    func gameOver() {
        let resultsVC = ResultsViewController()
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

