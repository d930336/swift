//
//  ViewController.swift
//  Json_URL
//
//  Created by 張詠俊 on 2019/5/28.
//  Copyright © 2019 張詠俊. All rights reserved.
//

import UIKit
/*
struct WebSiteDescription:Decodable{
    let name:String
    let description:String
    let courses:[Course]
}
*/

struct Course: Decodable{
    
    //Due to prevent data missing field
    let coupon_id:String
    let coupon_title:String
    let coupon_class:String
    let coupon_content:String
    let coupon_price:Int
//    let link:String?
//    let imageUrl:String?

//Swift 2/3/objectC
//    init(json:[String:Any]) {
//        coupons = json["coupons"] as? String ?? ""
//        users = json["users"] as? String ?? ""
////        link = json["link"] as? String ?? ""
////        imageUrl = json["imageUrl"] as? String ?? ""
//
//    }
    
}

struct CouponsList: Decodable{
    let count:Int
    let next:URL
    let results:[Course]
}




class ConnectDatabase: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let JsonURL = "https://66a97240.ngrok.io/coupon/?format=json"
        
        guard let url = URL(string: JsonURL) else {return}
        
        URLSession.shared.dataTask(with: url){  (data,response,err)in
            
         
            guard let data = data else {return}
//            let dataString = String(data: data,encoding: .utf8)
//            print("dataString:",dataString)
//
            
            do{

                //data inconsistent(missing field)
                let couponlist = try JSONDecoder().decode(CouponsList.self, from: data)
                let UserURL = couponlist.results
                
                print("coursers",couponlist)
                print("users",UserURL)
                
            }catch let jsonErr{
                print("Error",jsonErr)
            }
           
            
            
        }.resume()
    
    
    }


}


