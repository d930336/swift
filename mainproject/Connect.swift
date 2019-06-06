//
//  APIDelegate.swift
//  messageBoardTest
//
//  Created by YEH MING KUEI on 2017/4/7.
//  Copyright © 2017年 YEH MING KUEI. All rights reserved.
//

import Foundation

class Connect{
    var action : String?
    var vc : succDelegate?
    init(a:String , vc: succDelegate?){
        print("2")
        action = a
        self.vc = vc
    }
    
    init(vc: succDelegate?){
        print("connect")
        self.vc = vc
    }
    
    func connect(rowInfo :[String:Any]){
        
        let urlString = "http://192.168.100.209:8000/\(action!)/"
        //let myUrl = URL(String: urlString)
        let myUrl = URL(string: urlString)
        var request = URLRequest(url:myUrl!)

        let ree = rowInfo as [String : Any]
        request.httpMethod = "POST"
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: ree, options: .prettyPrinted)
        
        print( try! JSONSerialization.jsonObject(with: try! JSONSerialization.data(withJSONObject: ree, options: []), options: .mutableContainers))
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
//            do {
                if data != nil{
                    print("success")
                    self.vc?.success(data: data!)
                }
//                let json = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as? NSDictionary
//                
//                if json != nil {
//                    print("success")
//                   
//                }
//            } catch {
//                print(error)
//            }
        }
        task.resume()
    }
}

protocol succDelegate {
    func success(data:Data)
}
