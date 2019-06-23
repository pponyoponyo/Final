//
//  calViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 17/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class calViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet var dateTableView: UITableView!
    @IBOutlet var year: UILabel!
    @IBOutlet var month: UILabel!

    
    let date = DateFormatter()
    let now = Date()
    var dateArrays =  Array<Array<String>>()
    var calMon : Int = 0
    var calyear : Int = 0
    var calday : Int = 0
    var monNum : Int  = 0

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dateTableView.dequeueReusableCell(withIdentifier: "Cal Cell", for: indexPath) as! calElementTableViewCell
        
        // Configure the cell...

        cell.label1.text = dateArrays[indexPath.row][0]
        cell.label2.text = dateArrays[indexPath.row][1]
        cell.label3.text = dateArrays[indexPath.row][2]
        cell.label4.text = dateArrays[indexPath.row][3]
        cell.label5.text = dateArrays[indexPath.row][4]
        cell.label6.text = dateArrays[indexPath.row][5]
        cell.label7.text = dateArrays[indexPath.row][6]
        

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        date.dateFormat = "yyyy"
        var today = date.string(from: now)
        year.text = today
        calyear = Int(today)!
        date.dateFormat = "M"
        today = date.string(from: now)
        month.text = today
        calMon = Int(today)!
        date.dateFormat = "dd"
        today = date.string(from: now)
        calday = Int(today)!
        
        calday -= 1
        calday %= 7
        if (calday != 0){
            calday = 7 - calday
        }
        
        makeCal()
    }
    
    @IBAction func previousMonth() {
        if((calMon - 1 ) < 1){
            calMon = 13
            calyear -= 1
            year.text = String(calyear)
        }
        calMon -= 1
        month.text = String(calMon)
        
        switch calMon {
        case 1:
            monNum = 31
            break;
        case 2:
            if((calyear % 4 == 0)&&(calyear % 100 != 0)){
                monNum = 29
            }else {
                monNum = 28
            }
            break;
        case 3 :
            monNum = 31
            break;
        case 4:
            monNum = 30
            break;
        case 5:
            monNum = 31
            break;
        case 6 :
            monNum = 30
            break;
        case 7:
            monNum = 31
            break;
        case 8 :
            monNum = 31
            break;
        case 9:
            monNum = 30
            break;
        case 10:
            monNum = 31
            break;
        case 11:
            monNum = 30
            break;
        default:
            monNum = 31
        }
         if (calday != 0){
            calday = 7 - calday
        }
        calday += monNum
        calday %= 7
        if (calday != 0){
            calday = 7 - calday
        }
        makeCal()
        dateTableView.reloadData()
    }
    
    @IBAction func nextMonth() {
        
        if((calMon + 1 ) > 12){
            calMon = 0
            calyear += 1
            year.text = String(calyear)
        }
        calMon += 1
        month.text = String(calMon)
        calday += monNum
        makeCal()
        dateTableView.reloadData()
    }
    
    func makeCal(){
        
        dateArrays = Array<Array<String>>()
        var index = 0
        
        let dayArrays :Array<String> = ["일","월","화","수","목","금","토"]
    
        dateArrays.append(dayArrays)
        
       calday %= 7
        
        switch calMon {
        case 1:
            monNum = 31
            break;
        case 2:
            if((calyear % 4 == 0)&&(calyear % 100 != 0)){
                monNum = 29
            }else {
                monNum = 28
            }
            break;
        case 3 :
            monNum = 31
            break;
        case 4:
            monNum = 30
            break;
        case 5:
            monNum = 31
            break;
        case 6 :
            monNum = 30
            break;
        case 7:
            monNum = 31
            break;
        case 8 :
            monNum = 31
            break;
        case 9:
            monNum = 30
            break;
        case 10:
            monNum = 31
            break;
        case 11:
            monNum = 30
            break;
        default:
            monNum = 31
        }

        for i in 0...6 {
            
  
            var temp = Array<String>()
            var originalNumbers = Array (1...32)
            
            for j in 0...6{
                
                if i == 0{
                    if(j < calday){
                        temp.append(" ")
                    }else{
                        temp.append(String(originalNumbers[index]))
                        index += 1
                    }
                }else{
                    if(index >= monNum){
                        temp.append(" ")
                    }else{
                        temp.append(String(originalNumbers[index]))
                        index += 1
                    }
                }
            }
        
            dateArrays.append(temp)
        }
        dateTableView.reloadData()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
