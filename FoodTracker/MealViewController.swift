//
//  MealViewController.swift
//  FoodTracker
//
//  Created by UC BROS on 4/23/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var txtMealField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtMealField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //text delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtMealField.text = textField.text
    }

    //default button
    @IBAction func btnDefaultLabelText(_ sender: UIButton) {
        txtMealField.text = "Default Text"
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
