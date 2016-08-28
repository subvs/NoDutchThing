//
//  GameWaitingForOthersViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit

class GameWaitingForOthersViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gameWaitingImageView = UIImageView(image: UIImage(named:"GameWaitingBackground"))
        gameWaitingImageView.frame = self.view.frame
        
        self.view.addSubview(gameWaitingImageView)
        
        //self.view.backgroundColor = UIColor.greenColor() //
        
        let spinnerDimension = CGFloat(200.0)
        let spinnerFrame = CGRect(x: self.view.frame.width / 2.0 - spinnerDimension / 2.0, y: self.view.frame.height / 2.0 - spinnerDimension / 2.0 + 150.0, width: spinnerDimension, height: spinnerDimension)
        
        let spinnerView = UIActivityIndicatorView(frame: spinnerFrame)
        spinnerView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        spinnerView.startAnimating()
     
        self.view.addSubview(spinnerView)

        
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
        
        let gameVC = GameViewController()
        self.navigationController?.pushViewController(gameVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

