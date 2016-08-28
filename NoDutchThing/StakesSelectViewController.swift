//
//  StakesSelectViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit

class StakesSelectViewController: UIViewController {
    
    var isLeft: Bool = true

    var sceneImageView: UIImageView?
    var headerImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let headerHeight = CGFloat(100.0)
        
        sceneImageView = UIImageView(image: UIImage(named:"StakesBackground"))
        sceneImageView!.frame = CGRect(x:0.0, y:0.0, width:self.view.frame.width * 2.0, height:self.view.frame.height)
        
        self.view.addSubview(sceneImageView!)

        
        headerImageView = UIImageView(image: UIImage(named:"StakesHeader"))
        headerImageView!.frame = CGRect(x:0.0, y:0.0, width:self.view.frame.width, height:181.0 / 2.0)
        
        headerImageView!.layer.shadowColor = UIColor.blackColor().CGColor
        headerImageView!.layer.shadowOpacity = 1
        headerImageView!.layer.shadowOffset = CGSizeZero
        headerImageView!.layer.shadowRadius = 3
        
        self.view.addSubview(headerImageView!)

        
        let selectStakesButton = UIButton()
        selectStakesButton.frame = CGRect(x:0.0, y:0.0, width:self.view.frame.width, height:300.0)
        selectStakesButton.alpha = 0.3 // TODO: Change
        selectStakesButton.addTarget(self, action: #selector(StakesSelectViewController.selectStakesButtonTapped(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(selectStakesButton)
        
        
        let switchButton = UIButton()
        switchButton.frame = CGRect(x:0.0, y:300.0, width:self.view.frame.width, height:self.view.frame.height - 300.0)
        switchButton.alpha = 0.3 // TODO: Change
        switchButton.addTarget(self, action: #selector(StakesSelectViewController.switchButtonTapped(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(switchButton)
    }
    
    func switchButtonTapped(sender: UIButton!) {
        
        let destX = isLeft ? CGFloat(-320.0) : CGFloat(0.0)
        isLeft = !isLeft
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.sceneImageView!.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, destX, 0.0)
            
            },
                                   completion: nil)
        
    }

    func selectStakesButtonTapped(sender: UIButton!) {
        let gameTapVC = GameTapToPositionViewController()
        self.navigationController?.pushViewController(gameTapVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

