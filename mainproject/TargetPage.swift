//
//  TargetPage.swift
//  mainproject
//
//  Created by Benson Yang on 2019/5/29.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit
import SQLite
import SQLite3

class TargetPage: UIViewController {

        
    

    
//---------------------first edition------------------------
 
    var database: Connection!
    
    let users = Table("users")
    let id = Expression<Int>("id")
    let name = Expression<Int>("name")
    let email = Expression<String>("email")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func insert(_ sender: Any) {
        print("INSERT TAPPED")
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "name" }
      
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text
            
            else  { return }
            print(name)
            
            let Table = self.users.create {
                (table) in table.column(self.name)
            }
            
            
            let insertUser = self.users.insert(self.name <- Int(name) ?? 0)
            
            do {
                try self.database.run(Table)
                try self.database.run(insertUser)
                print("INSERTED USER")
            } catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    
    @IBOutlet weak var showTarget: UILabel!
    @IBAction func five(_ sender: Any) {
        
    do{
        let users = try self.database.prepare(self.users)
        for user in users {
        //showTarget.text = "\(String(user[self.name]))"
        print("name: \(user[self.name])")
        }
    
    }catch{
        print(error)
        }
        showTarget.text = "\((users[self.name]))"
    }
    
    

}
