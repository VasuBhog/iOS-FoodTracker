////
////  MealImageTableTableViewController.swift
////  FoodTracker
////
////  Created by UC BROS on 4/21/18.
////  Copyright © 2018 University of Cincinnati. All rights reserved.
////
//
//import UIKit
//
//var imagesDirectoryPath:String!
//var images: [UIImage]!
//var titles:[String]!
//
//class MealImageTableTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
//
//    @IBOutlet weak var MealImage: UIImageView!
//    
//    @IBOutlet weak var lblMeal: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        images = []
//        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        // Get the Document directory path
//        let documentDirectorPath:String = paths[0]
//        // Create a new path for the new images folder
//        imagesDirectoryPath = documentDirectorPath + "/ImagePicker"
//        var objcBool:ObjCBool = true
//        let isExist = FileManager.default.fileExists(atPath: imagesDirectoryPath, isDirectory: &objcBool)
//        // If the folder with the given path doesn't exist already, create it
//        if isExist == false{
//            do{
//                try FileManager.default.createDirectory(atPath: imagesDirectoryPath, withIntermediateDirectories: true, attributes: nil)
//            }catch{
//                print("Something went wrong while creating a new folder")
//            }
//        }
//        // Do any additional setup after loading the view.
//    }
//    
//    @IBAction func choosePhoto(_ sender: Any) {
//        let imagePicker = UIImagePickerController()
//        present(imagePicker, animated: true, completion: nil)
//        imagePicker.delegate = self
//    }
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        
//        // Save image to Document directory
//        var imagePath = NSDate().description
//        imagePath = imagePath.replacingOccurrences(of: " ", with: "")
//        imagePath = imagesDirectoryPath + "/\(imagePath).png"
//        let data = UIImagePNGRepresentation(image)
//        let success = FileManager.default.createFile(atPath: imagePath, contents: data, attributes: nil)
//        dismiss(animated: true) { () -> Void in
//            self.refreshTable()
//        }
//    }
//    
//    func refreshTable(){
//        do{
//            images.removeAll()
//            titles = try FileManager.default.contentsOfDirectory(atPath: imagesDirectoryPath)
//            for image in titles{
//                let data = FileManager.default.contents(atPath: imagesDirectoryPath + ("/\(image)"))
//                let image = UIImage(data: data!)
//                images.append(image!)
//            }
//            self.tableView.reloadData()
//        }catch{
//            print("Error")
//        }
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CellID")
//        cell?.imageView?.image = images[indexPath.row]
//        cell.textLabel?.text = titles[indexPath.row]
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return images.count
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

