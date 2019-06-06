//
//  CouponCell.swift
//  mainproject
//
//  Created by Benson Yang on 2019/3/14.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit

class CouponCell: UITableViewCell {

   
    @IBOutlet weak var CouponStore: UILabel!
    @IBOutlet weak var CouponDiscount: UILabel!
    
    func setCoupon(coupon: Coupon){
        CouponStore.text = coupon.Store
        CouponDiscount.text = coupon.Discount
   }
    
   
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame = newValue
            //frame.origin.x += 15
            //frame.size.width -= 2 * 15
            frame.origin.x = 10;//这里间距为10，可以根据自己的情况调整
            frame.size.width -= 2 * frame.origin.x;
            frame.size.height -= 1 * frame.origin.x;
            super.frame = frame
        }
    }
 
    
  
}
