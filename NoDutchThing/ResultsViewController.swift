//
//  ResultsViewController.swift
//  NoDutchThing
//
//  Created by Vishal Srivastava on 8/27/16.
//  Copyright © 2016 Subversus Interactive. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var paymentReceivedVC: PaymentReceivedViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let resultsImageView = UIImageView(image: UIImage(named:"ResultsScreen"))
        resultsImageView.frame = self.view.frame
        
        self.view.addSubview(resultsImageView)
        
        
        
        let payNowButton = UIButton()
        payNowButton.frame = self.view.frame // TODO: Change
        payNowButton.alpha = 0.3 // TODO: Change
        payNowButton.addTarget(self, action: #selector(ResultsViewController.payNowButtonTapped(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(payNowButton)
        
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func payNowButtonTapped(sender: UIButton!) {
        
        let spinnerDimension = CGFloat(200.0)
        let spinnerFrame = CGRect(x: self.view.frame.width / 2.0 - spinnerDimension / 2.0, y: self.view.frame.height / 2.0 - spinnerDimension / 2.0, width: spinnerDimension, height: spinnerDimension)
        
        let spinnerView = UIActivityIndicatorView(frame: spinnerFrame)
        spinnerView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        spinnerView.startAnimating()
        
        self.view.addSubview(spinnerView)
        
        
        
        
        
        let baseURL = "https://nodutch.azurewebsites.net/api/simplify/chargeCard?user=harvey&amount=8650/"
        
        let path = baseURL + "api/simplify/chargeCard?user=harvey&amount=8650"
        
        RestApiManager.sharedInstance.makeHTTPGetRequest(path, onCompletion: { json, err in
            //onCompletion(json as JSON)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.paymentReceivedVC = PaymentReceivedViewController()
                self.navigationController?.pushViewController(self.paymentReceivedVC!, animated: true)
            }

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

