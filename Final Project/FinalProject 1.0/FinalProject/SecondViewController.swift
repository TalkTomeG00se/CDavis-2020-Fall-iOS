//
//  SecondViewController.swift
//  FinalProject
//
//  Created by Colten Davis on 12/9/20.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {

    @IBOutlet weak var DecryptOutputField: UITextField!
    @IBOutlet weak var DecryptButton: UIButton!
    @IBOutlet weak var DecryptTextInputField: UITextField!
    
    var decryptedItems = [Crypt]()
    var moc:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moc = appDelegate?.persistentContainer.viewContext
        
        DecryptTextInputField.backgroundColor = UIColor.white
        DecryptOutputField.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    let alphabet: [Character] = Array("abcdefghijklmnopqrstuvwxyz")
    
    func caesarEncode(_ input: String, shiftBy: Int = 13) -> String {
        var result: String = ""
        for char in input {
            if let idx = alphabet.firstIndex(of: char) {
                var newIdx = (idx + shiftBy) % alphabet.count
                if newIdx < 0 { newIdx += alphabet.count }
                result.append(alphabet[newIdx])
            }
        }
        return result
    }

    func caesarDecode(_ input: String, shiftBy: Int = 13) -> String {
        return caesarEncode(input, shiftBy: -shiftBy)
    }
    
    @IBAction func DecryptButtonPressed(_ sender: UIButton!) {
        
        let decryptedItem = Crypt(context: moc)
        
        let decryptInputText = DecryptTextInputField.text
        
        let decryptOutput = caesarDecode(decryptInputText!)
        
        decryptedItem.type = "Decryption"
        
        decryptedItem.input = decryptInputText
        
        decryptedItem.output = decryptOutput
        
        DecryptOutputField.text = decryptOutput
        
        appDelegate?.saveContext()
    }
    

}
