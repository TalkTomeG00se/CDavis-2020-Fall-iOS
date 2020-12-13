//
//  ViewController.swift
//  FinalProject
//
//  Created by Colten Davis on 12/8/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var TextToEncryptField: UITextField!
    @IBOutlet weak var EncryptOutputField: UITextField!
    @IBOutlet weak var EncryptButton: UIButton!
    
    var encryptedItems = [Crypt]()
    var moc:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        
        TextToEncryptField.backgroundColor = UIColor.white
        EncryptOutputField.backgroundColor = UIColor.white
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
    
    @IBAction func EncryptButtonPressed(_ sender: UIButton!) {
        
        let encryptedItem = Crypt(context: moc)
        
        encryptedItem.type = "Encryption"
        
        let textToEncrypt = TextToEncryptField.text
        
        let outputText = caesarEncode(textToEncrypt!)
        
        encryptedItem.input = textToEncrypt
        
        encryptedItem.output = outputText
        
        EncryptOutputField.text = outputText
        
        appDelegate?.saveContext()
    }
}

