//
//  MealImageDataSource.swift
//  FoodTracker
//
//  Created by UC BROS on 4/22/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class MealImageDataSource: NSObject {
    
    let mealImages = NSMutableArray()
    
    override init() {
        super.init()
        loadMealImages()
    }
    
    func loadMealImages() {
        let fileURL = getFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path)){
            let contents = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as! NSArray
            mealImages.addObjects(from: contents as! [Any])
        }
    }
    
    func getFileURL() -> URL {
        let fileManager = FileManager.default
        let homeDir = try! fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
        let fileURL = homeDir.appendingPathComponent("foodTracker.data")
        return fileURL
    }
    
    func saveMealImages() {
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(mealImages, toFile: fileURL.path)
    }
    
    func addMealImage(mealImage m: MealImage) {
        mealImages.add(m)
        saveMealImages()
    }
    
    func countOfMealImages() -> Int {
        return mealImages.count
    }
    
    func mealImageAtIndex(index i: Int) -> MealImage {
        return mealImages.object(at: i) as! MealImage
    }
    
    func deleteMealImage(at index: Int) {
        mealImages.removeObject(at: index)
        saveMealImages()
    }
    
    func getCurretnMealName(at index: Int) -> String {
        let meal = mealImageAtIndex(index: index)
        return meal.mealName
    }
    
    func updateMealName(at index: Int, newName name: String) {
        let meal = mealImageAtIndex(index: index)
        meal.mealName = name
        saveMealImages()
    }
    
    func moveMealImages(from fromIndex:Int, to toIndex: Int){
        let fromMealImage = mealImageAtIndex(index: fromIndex)
        let toMealImage = mealImageAtIndex(index: toIndex)
        mealImages.replaceObject(at: fromIndex, with: toMealImage)
        mealImages.replaceObject(at: toIndex, with: fromMealImage)
        saveMealImages()
    }

}
