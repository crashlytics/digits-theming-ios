//
//  ViewController.swift
//  DigitsThemes
//
//  Created by Valentin Polouchkine  on 8/12/15.
//  Copyright (c) 2015 Fabric. All rights reserved.
//
// Background pattern from subtlepatterns.com

import UIKit
import DigitsKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Digits.sharedInstance().logOut()
    }
    
    @IBAction func didTapButton(sender: UIButton) {
        let configuration = DGTAuthenticationConfiguration(accountFields: .DefaultOptionMask)
        configuration.appearance = DGTAppearance()

        configuration.appearance.logoImage = UIImage(named: "logo")
        
        configuration.appearance.labelFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
        configuration.appearance.bodyFont = UIFont(name: "HelveticaNeue-Italic", size: 16)
        
        configuration.appearance.accentColor = UIColor(red:0.33, green:0.67, blue:0.93, alpha:1.0)
        configuration.appearance.backgroundColor = UIColor(patternImage: UIImage(named: "bg-pattern")!)
        
        Digits.sharedInstance().authenticateWithViewController(self, configuration: configuration) { (session, error) -> Void in
            if (session != nil) {
                self.btnLogin.setTitle("Your Digits User ID is " + session.userID, forState: UIControlState.Normal)
            }
            else {
                print(error.localizedDescription)
            }
            
        }
   }
}