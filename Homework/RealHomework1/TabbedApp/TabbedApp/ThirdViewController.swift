//
//  ThirdViewController.swift
//  TabbedApp
//
//  Created by Colten Davis on 9/7/20.
//  Copyright © 2020 Colten Davis. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var colorButtonPressed = false

  
    @IBOutlet weak var BlueButton: UIButton!
    @IBOutlet weak var MainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "mountain3.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    
   
    @IBAction func ChangeFontSizeSlider(_ sender: UISlider) {
        
        MainLabel.font = MainLabel.font.withSize(CGFloat(Int(sender.value)))
    }
    @IBAction func ChangeLabelBlueButton(_ sender: Any) {
        
        if colorButtonPressed == false {
        
            MainLabel.textColor = UIColor.green
            
            colorButtonPressed = true
        
        } else {
            
            MainLabel.textColor = UIColor.systemBlue
            
            colorButtonPressed = false
        }
    }
}
