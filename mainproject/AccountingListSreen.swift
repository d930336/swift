//
//  AccountingListSreen.swift
//  mainproject
//
//  Created by Benson Yang on 2019/3/15.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit

class AccountingListSreen: UIViewController {
    
   
    @IBOutlet weak var tableview: UITableView!
    var accounting : [Accounting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accounting = createArray()

    }
    func createArray() -> [Accounting]{
        
        var tempaccounting: [Accounting] = []
        
        let accounting1 = Accounting(Name: "chiken", Price: "999", Date: "10/10")
        let accounting2 = Accounting(Name: "chiken", Price: "999", Date: "10/10")
        let accounting3 = Accounting(Name: "chiken", Price: "999", Date: "10/10")
        let accounting4 = Accounting(Name: "chiken", Price: "999", Date: "10/10")
        let accounting5 = Accounting(Name: "chiken", Price: "999", Date: "10/10")
        let accounting6 = Accounting(Name: "chiken", Price: "999", Date: "10/10")
        
        tempaccounting.append(accounting1)
        tempaccounting.append(accounting2)
        tempaccounting.append(accounting3)
        tempaccounting.append(accounting4)
        tempaccounting.append(accounting5)
        tempaccounting.append(accounting6)
        
        return tempaccounting
    }
    
}


extension AccountingListSreen {
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounting.count
        
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Accounting = accounting[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountingCell") as! AccountingCell
        
        cell.setAccounting(accounting: Accounting)
        
        
        
        
        return cell
    }
}

    
    
