//
//  LogIn.swift
//  mainproject
//
//  Created by Benson Yang on 2019/6/11.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit

class LogIn: UIViewController {
   
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var show: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBAction func login(_ sender: Any) {
        let Password = String(password.text!)
        show.text = String(Password)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
