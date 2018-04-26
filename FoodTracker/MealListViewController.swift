//
//  MealListViewController.swift
//  FoodTracker
//
//  Created by UC BROS on 4/21/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit


class MealListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var mealList: UITableView!
    let dataSource = MealImageDataSource()
    var mealDate : String!
    var mealName : String!
    var chosenImage : UIImage!
    var mealImage: MealImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.countOfMealImages()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let cellMealImage = dataSource.mealImageAtIndex(index: indexPath.row)
        cell.textLabel?.text = cellMealImage.mealName
        cell.imageView?.image = cellMealImage.mealImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.deleteMealImage(at: indexPath.row)
            mealList.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // trigger when user click the cell in tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showInputDialog() // update mealName from user
        dataSource.updateMealName(at: indexPath.row, newName: mealName) // update mealName to dataSource
        mealList.reloadData()
    }
    
    var imagePicker: UIImagePickerController!
    
    //camera function
    @IBAction func btnCamera(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let cameraAction = UIAlertAction(title: "Use Camera", style: .default){ (action) in
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Use Photo Library", style: .default){ (action) in
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        mealName = mealDate
        mealImage = MealImage(withphotoName: mealName, image: chosenImage, date: mealDate)
        dataSource.addMealImage(mealImage: mealImage)
        mealList.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (action) in
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            
            self.mealName = name
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Meal Name"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        present(alertController, animated: true, completion: nil)
    }
}

//display message
//        var alertControllerMessage : UIAlertController?
//        alertControllerMessage = UIAlertController(title: "Enter Meal", message: "Enter the name of the meal", preferredStyle: .alert)
//
//        alertControllerMessage!.addTextField(configurationHandler: ({(texField : UITextField!) in texField.placeholder = "Enter a Meal"}))
//
//        let action = UIAlertAction(title: "Submit", style: UIAlertActionStyle.default, handler: {[weak self] (paramAction:UIAlertAction!) in
//            if let textFields = alertControllerMessage?.textFields{
//                let theTextFields = textFields as [UITextField]
//                let enteredText = theTextFields[0].text
//                self!.tableView(<#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>)
//                }
//            })
//            alertControllerMessage?.addAction(action)
//            present(alertControllerMessage!, animated: true, completion: nil)
//        }

//

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


