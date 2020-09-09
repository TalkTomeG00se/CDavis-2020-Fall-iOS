//
//  ViewController.swift
//  MyFirstapp
//
//  Created by Colten Davis on 8/27/20.
//  Copyright © 2020 Colten Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonPressed = false
    var switchToggled = false

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var changeButton: UIButton!
    
    @IBOutlet weak var changeSwitch: UISwitch!
    
    @IBOutlet weak var numberStepper: UIStepper!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeText(_ sender: Any) {
        if buttonPressed == false {
            
        titleLabel.text = "You changed title with button!"
            
        buttonPressed = true
        } else {
            
            titleLabel.text = "First App Hello World!"
            
            buttonPressed = false
        }
        
    }
    @IBAction func changeTextSwitch(_ sender: Any) {
        if switchToggled == false{
            
            changeButton.tintColor = UIColor.black
            
            switchToggled = true
        } else{
            
            changeButton.tintColor = UIColor.systemBlue
            
            switchToggled = false
        }
        
    }
    
    
    @IBAction func numberChanger(_ sender: UIStepper) {
        
        valueLabel.text = Int(sender.value).description
        
        
    }
}

