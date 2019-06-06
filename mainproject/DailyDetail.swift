//
//  DailyDetail.swift
//  mainproject
//
//  Created by Benson Yang on 2019/4/12.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit

enum OperationType{
    case add
    case substract
    case none
}

class DailyDetail: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
    
    //detail
    var typeShow : String!
   
    //account
   
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation:OperationType = .none
    var startNew = true
    
    //----------------type---------------------
    
    @IBOutlet weak var pickerView: UIPickerView!
  
    @IBOutlet weak var tableView: UITableView!
    
    
    let types = ["Tools","Traffic","beverage","Place","Food","Sneak","Other"]
    
    
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
 
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeShow = types[row]
    }
 
  //--------------------date picker-----------------------------
    var datedata : String!
    @IBOutlet weak var getDateValue: UIDatePicker!
    
    @IBAction func dateAction(_ sender: UIDatePicker) {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "MM dd " // 設定要顯示在Text Field的日期時間格式
        datedata = dateValue.string(from: getDateValue.date) // 更新Text Field的內容
    }
    
    
    
    
  //--------------------calculator-------------------------------
    
    @IBOutlet weak var total: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber=sender.tag-1
        if total.text != nil {
            if total.text == "0"||total.text == "+"||total.text == "-"{
            total.text = "\(inputNumber)"
            }else{
                total.text = total.text!+"\(inputNumber)"
            }
        }
        numberOnScreen =  Double(total.text!) ?? 0
    }
    
    
    @IBAction func clean(_ sender: UIButton) {
        total.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        startNew = true
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        total.text = "+"
        previousNumber = numberOnScreen
        performingMath = true
        operation = .add
    }
    
    @IBAction func substract(_ sender: UIButton) {
        total.text = "-"
        previousNumber = numberOnScreen
        performingMath = true
        operation = .substract
    }
    
    
    @IBAction func answer(_ sender: Any) {
        if performingMath == true{
            switch operation{
                case .add:
                    numberOnScreen = previousNumber+numberOnScreen
                    makeOkNumberString(from: numberOnScreen)
                case .substract:
                    numberOnScreen = previousNumber-numberOnScreen
                    makeOkNumberString(from: numberOnScreen)
                case .none:
                    total.text = "0"
            }
            performingMath = false
            startNew = true
        }
    }
    
    func makeOkNumberString(from number:Double) {
        if floor(number) == number{
            total.text = "\(Int(number))"
        }else{
            total.text = "\(number)"
        }
    }
    
   //--------------------------------------------
    let cellSpacingHeight: CGFloat = 10
    
    let selectedBackgroundView = UIView()
    
    var dailyDetailForm : [DailyDetailForm] = []

    //-------------------viewdidload-------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        selectedBackgroundView.backgroundColor = UIColor.clear
        
        dailyDetailForm = createArray()
    /*
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
 
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    */
    }
    //------------------swipe back-------------------------
   /*
    required init?(coder aDecoder: NSCoder) {
        <#code#>
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        
        if sender.state == .ended {
            switch sender.direction {
                
            case .left:
              
                show(pageviewcontroller.init(), sender: Any.self)
            default:
                break
                
            }
        }
    }
 */
 //----------------delete row---------------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dailyDetailForm.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .bottom)
    }
    
    func tableView(_ tableView: UITableView, heightForFootererInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFootererInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    // Set the spacing between sections
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return cellSpacingHeight
     }
 */
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    //去除tableView 多余行的方法 添加一个tableFooterView 后面多余行不再显示
    
    //----------------------insert row-------------------------------
    
    @IBAction func insert(_ sender: UIButton) {
        insertNewRow()
    }
  
    func insertNewRow() {
        
        
        
        let daily = DailyDetailForm(Date: datedata, Name: typeShow, Price: "\(Int(numberOnScreen))"  , Coupon: "none")
        
        dailyDetailForm.append(daily)
        
        let indexPath = IndexPath(row: dailyDetailForm.count - 1,section :0)
        tableView.beginUpdates()
        tableView.insertRows(at:[indexPath], with: .automatic)
        tableView.endUpdates()
        
        
    }
    
   
    func createArray() -> [DailyDetailForm]{
        
        var tempDetail: [DailyDetailForm] = []
        
        let daily1 = DailyDetailForm(Date: "4/20", Name: "KFC", Price: "199", Coupon: "20%")
        let daily2 = DailyDetailForm(Date: "4/20", Name: "KFC", Price: "299", Coupon: "30%")
        let daily3 = DailyDetailForm(Date: "4/20", Name: "KFC", Price: "399", Coupon: "40%")

        tempDetail.append(daily1)
        tempDetail.append(daily2)
        tempDetail.append(daily3)

     
        
        return tempDetail
    }
    
}

extension DailyDetail:UITableViewDataSource,UITableViewDelegate {
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyDetailForm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dailyDetailForms = dailyDetailForm[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyDetailCell") as! DailyDetailCell
        
        
        cell.setDailyDetailForm(dailyDetailForm: dailyDetailForms)
        cell.selectedBackgroundView = selectedBackgroundView
        
        // note that indexPath.section is used rather than indexPath.row
        //cell.textLabel?.text = self.animals[indexPath.section]
        
        // add border and color
        cell.backgroundColor = UIColor.init(white: 1, alpha: 0.75)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.75
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = false
        
        return cell
        
        
        
    }
    
    
}




/*extension UIViewController : UIPickerViewDataSource ,UIPickerViewDelegate{
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
    }
   */
   
    //to show the type
    /* public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    */
    

