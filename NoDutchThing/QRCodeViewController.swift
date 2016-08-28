//
//  QRCodeViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit
import Foundation
//import AVFoundation

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}

class QRCodeViewController: UIViewController {
    
    #if arch(i386) || arch(x86_64)
        var imagePicker: UIView?
    #else
        var imagePicker: UIImagePickerController?
    #endif

    
    override func viewDidLoad() {
        


        //self.view.backgroundColor = UIColor.purpleColor()
        
        
        #if arch(i386) || arch(x86_64)
            imagePicker = UIView(frame: self.view.frame)
            imagePicker?.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(imagePicker!)
        #else
            imagePicker = UIImagePickerController()
            
            imagePicker!.allowsEditing = false
            imagePicker!.sourceType = .Camera
            
            self.view.addSubview(imagePicker!.view)
        #endif
        
        
        
        let marginHeight = CGFloat(200.0)
        let marginWidth = CGFloat(50.0)
        
        let blackRectBottom = UIView()
        blackRectBottom.backgroundColor = UIColor.blackColor()
        blackRectBottom.frame = CGRect(x: 0.0, y: self.view.frame.height - marginHeight, width: self.view.frame.width, height: marginHeight)
        self.view.addSubview(blackRectBottom)

        let blackRectTop = UIView()
        blackRectTop.backgroundColor = UIColor.blackColor()
        blackRectTop.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: marginHeight)
        self.view.addSubview(blackRectTop)
        
        let blackRectLeft = UIView()
        blackRectLeft.backgroundColor = UIColor.blackColor()
        blackRectLeft.frame = CGRect(x: 0.0, y: 0.0, width: marginWidth, height: self.view.frame.height)
        self.view.addSubview(blackRectLeft)

        let blackRectRight = UIView()
        blackRectRight.backgroundColor = UIColor.blackColor()
        blackRectRight.frame = CGRect(x: self.view.frame.width - marginWidth, y: 0.0, width: marginWidth, height: self.view.frame.height)
        self.view.addSubview(blackRectRight)
        
        let topImageView = UIImageView(image:(UIImage(named:"scantext")))
        topImageView.frame = CGRect(x: 0.0, y: 100.0, width: self.view.frame.width, height: 92.0)
        self.view.addSubview(topImageView)
        
        let bottomImageView = UIImageView(image:(UIImage(named:"whitelableqr")))
        bottomImageView.frame = CGRect(x: 0.0, y: self.view.frame.height - 200.0, width: self.view.frame.width, height: 75.0)
        self.view.addSubview(bottomImageView)
        
        

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
        let stakesSelectVC = StakesSelectViewController()
        self.navigationController?.pushViewController(stakesSelectVC, animated: true)
    }
}