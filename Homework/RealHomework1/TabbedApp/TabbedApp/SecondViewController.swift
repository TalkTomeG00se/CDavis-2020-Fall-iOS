//
//  SecondViewController.swift
//  TabbedApp
//
//  Created by Colten Davis on 9/7/20.
//  Copyright © 2020 Colten Davis. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var buttonPressed = false

    @IBOutlet weak var FirstNumberTextField: UITextField!
    @IBOutlet weak var SecondNumberTextField: UITextField!
    @IBOutlet weak var AnswerTextField: UITextField!
    @IBOutlet weak var CalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "mountain2.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }

   
    @IBAction func GetAnswerButton(_ sender: Any) {
        
        let num1 = Int(FirstNumberTextField.text!)
        
        let num2 = Int(SecondNumberTextField.text!)
        
        let answer = Int(num1!) + Int(num2!)
        
        AnswerTextField.text = String(answer)
        
    }
    
}

