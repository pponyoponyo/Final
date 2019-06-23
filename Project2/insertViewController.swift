//
//  insertViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 17/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class insertViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var deadlinePicker: UIDatePicker!
    @IBOutlet var listTitle: UITextField!
    @IBOutlet var listDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePress(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-M-dd"
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ToDoList", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(listTitle.text, forKey: "title")
        object.setValue(listDetail.text, forKey: "detail")
        object.setValue(dateFormatter.string(from: self.deadlinePicker.date), forKey: "date")
    
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
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
