//
//  ViewController.swift
//  UserDefaults
//
//  Created by 所　紀彦 on 2019/05/31.
//  Copyright © 2019 所　紀彦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var text1:UITextField!
    @IBOutlet var text2:UITextField!
    
    var testTextArray: Dictionary<String,String> = [:]
    
    var save : Dictionary<String,String> = [:]
    //UserDefaultsのインスタンス
    let userDefaults = UserDefaults.standard
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if userDefaults.dictionary(forKey: "Data") != nil {
            testTextArray = userDefaults.object(forKey: "Data") as! Dictionary<String, String>
            text1.text = testTextArray["kudamono"]
            text2.text = testTextArray["yasai"]
        }
    }
    
    @IBAction func buttonTapped(_ sender:Any){
        save = ["kudamono": text1.text!,"yasai":text2.text!]
        userDefaults.set(save, forKey: "Data")
        userDefaults.set(text1.text, forKey: "kudamono")
        userDefaults.set(text2.text, forKey: "yasai")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //outputText.text = inputText.text
        self.view.endEditing(true)
    }

}

