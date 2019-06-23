//
//  detailViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class detailViewController: UIViewController {

    @IBOutlet var seeDetail: UITextView!
    
    @IBOutlet var seeDeadline: UITextField!
    @IBOutlet var seeTitle: UITextField!
    
    var detailList: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let list = detailList {
            seeTitle.text = list.value(forKey: "title") as? String
            seeDetail.text = list.value(forKey: "detail") as? String
            seeDeadline.text = list.value(forKey: "date") as? String
        }
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
