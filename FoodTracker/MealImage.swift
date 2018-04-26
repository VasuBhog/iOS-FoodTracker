//
//  MealImage.swift
//  FoodTracker
//
//  Created by UC BROS on 4/22/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class MealImage: NSObject, NSCoding {
    
    var mealName : String
    var mealImage : UIImage
    var mealDate : String
    
    override init() {
        mealName = "None"
        mealImage = UIImage()
        mealDate = "None"
        super.init()
    }
    
    init(withphotoName name: String, image: UIImage, date: String) {
        mealName = name
        mealImage = image
        mealDate = date
        super.init()
    }
    //encode
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mealName, forKey: "MealName")
        aCoder.encode(mealImage, forKey: "MealImage")
        aCoder.encode(mealDate, forKey: "MealDate")
    }
    //decode
    required init?(coder aDecoder: NSCoder) {
        mealName = aDecoder.decodeObject(forKey: "MealName") as! String
        mealImage = aDecoder.decodeObject(forKey: "MealImage") as! UIImage
        mealDate = aDecoder.decodeObject(forKey: "MealDate") as! String
        super.init()
    }

}
