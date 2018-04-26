//
//  ViewController.swift
//  FoodTracker
//
//  Created by UC BROS on 4/8/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //display the date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        lblDate.text = formatter.string(from: datePicker.date)
        
        //set formatter again
        formatter.dateFormat = "hh:mm a"
        lblTime.text = formatter.string(from: datePicker.date)
        
    }
    
    @IBAction func pickValue(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        lblDate.text = formatter.string(from: datePicker.date)
        
        //set formatter again
        formatter.dateFormat = "hh:mm a"
        lblTime.text = formatter.string(from: datePicker.date)
    }
    
//    func getDate() -> String!{
//        let date = lblDate.text
//        return date
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mealListVC = segue.destination as! MealListViewController
        mealListVC.mealDate = lblDate.text
    }
    
    


}

