//
//  PaymentReceivedViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit

class PaymentReceivedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let thankYouImageView = UIImageView(image: UIImage(named:"thankyouforplaying"))
        thankYouImageView.frame = self.view.frame
        
        self.view.addSubview(thankYouImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

