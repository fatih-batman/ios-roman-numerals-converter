//
//  ViewController.swift
//  romenConverter
//
//  Created by C02QJ4LZG8WN on 2/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    var myDict:[String:Int] = ["M":1000, "D":500, "C":100, "L":50,
                            "X":10, "V":5, "I":1
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var inputTextBox: UITextField!
    @IBOutlet weak var result: UILabel!
    

    
    @IBAction func cevir(_ sender: UIButton) {
        var toplamDeger = 0
        var hataliMi = false
        let characters = Array(inputTextBox.text!)
        //var basamakSayisi = characters.count
        hataliMi = harfKontrolEt(characters: characters) &&  harfKontrolEt2(characters: characters)
        
        
        for element in characters{
            //print(element)
            if myDict.keys.contains(String(element)) {
                toplamDeger += Int(myDict[String(element)]!)
            }
            else {
                print("Hatalı giriş yaptınız!")
                hataliMi = true
            }
        }
        
        if hataliMi == true {
            result.text = "Hatalı giriş yaptınız!"
        }
        else {
            result.text = String(toplamDeger)
        }
        
    }
    
    
    
    func harfKontrolEt (characters: Array<Character>) -> Bool {
        
        var char: String
        let size = characters.count
        
        for i in 0...size-1 {
            char = String(characters[i])
            for j in 1...3{
                if size>i+j {
                    if String(characters[i+j]) != char {
                        break
                    }
                }
                else {
                    break
                }
                if j==3 {
                    return true
                }
            }
            
        }
        return false
    }
    
    func harfKontrolEt2 (characters: Array<Character>) -> Bool {
        
        var char: String
        let size = characters.count
        let array: Array<String> = ["V","L","D"]
        
        
        for i in 0...size-1 {
            char = String(characters[i])
            if characters.contains(char) && size>i+1 {
                if myDict[char]!<myDict[String(characters[i+1])]! {
                    return true
                }
            }
            
        }
        return false
    }
    
    func harfKontrolEt3 (characters: Array<Character>) -> Bool {
        
        var char: String
        let size = characters.count
        let array: Array<String> = ["L","M","C"]
        
        
        for i in 0...size-1 {
            char = String(characters[i])
            if size > i+1 && char == "X" && 10 < myDict[String(characters[i+1])]! {
                if !array.contains(String(characters[i+1])) {
                    return true
                }
            }
            
        }
        return false
    }
    

}

