//
//  FirstViewController.swift
//  TabbedApp
//
//  Created by Colten Davis on 9/7/20.
//  Copyright © 2020 Colten Davis. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var wasPressed = true

    
    
    @IBOutlet weak var StepperButton: UIStepper!
    @IBOutlet weak var NumberLabel: UILabel!
    
    @IBOutlet weak var ResetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "mountain1.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }

    
    @IBAction func StepperPressed(_ sender: UIStepper) {
        
        NumberLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func ResetButtonPressed(_ sender: Any) {
        
        StepperButton.value = 0
        
        NumberLabel.text = "0"
    }
    
}

