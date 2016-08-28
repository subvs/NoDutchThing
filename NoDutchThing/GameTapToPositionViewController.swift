//
//  GameTapToPositionViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit

class GameTapToPositionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gameTapImageView = UIImageView(image: UIImage(named:"GameTapBackground"))
        gameTapImageView.frame = self.view.frame
        
        self.view.addSubview(gameTapImageView)
        
        //self.view.backgroundColor = UIColor.magentaColor() //
        
        
        let skipButton = UIButton()
        //skipButton.hidden = true
        skipButton.addTarget(self, action: #selector(QRCodeViewController.skipButtonTapped(_:)), forControlEvents: .TouchUpInside)
        skipButton.backgroundColor = UIColor.clearColor()
        skipButton.frame = self.view.frame
        self.view.addSubview(skipButton)
        
        
        
        //presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func skipButtonTapped(sender: UIButton!) {
        /*
         var alertView = UIAlertView();
         alertView.addButtonWithTitle("Ok");
         alertView.title = "title";
         alertView.message = "message";
         alertView.show();
         */
        
        let gameWaitingVC = GameWaitingForOthersViewController() //StakesSelectViewController() // TODO: !!!!!! CHANGE!!!!
        self.navigationController?.pushViewController(gameWaitingVC, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

