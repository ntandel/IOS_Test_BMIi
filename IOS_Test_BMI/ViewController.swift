//
//  ViewController.swift
//  IOS_Test_BMI

// Student ID : 301094688
// BMI TRACKING APPLICATION
// Date : 11 DECEMBER 2019


//  Created by Nisha Tandel on 2019-12-11.
//  Copyright © 2019 Nisha TAndel. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    var lastCalculationType: Int?

    var categorizer = BMICategorizer()

    @IBOutlet weak var toggleoutlet: UISwitch!
    
    @IBOutlet weak var addName: UITextField!
    @IBOutlet weak var addAge: UITextField!
    @IBOutlet weak var addSex: UITextField!
    
    @IBOutlet weak var labels: UILabel!
    
    @IBOutlet weak var labelWeightPoint: UILabel!
    @IBOutlet weak var weightlabel: UILabel!
    
    @IBOutlet weak var labelHeightPoint: UILabel!
    @IBOutlet weak var heightlabel: UILabel!
    
    @IBOutlet weak var labelBMIresult: UILabel!
    
    @IBOutlet weak var labelSummary: UILabel!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var segmentTheme: UISegmentedControl!
    @IBOutlet weak var imageBMI: UIImageView!
    
    @IBOutlet weak var sliderWeight: UISlider!
    
    @IBOutlet weak var sliderHeight: UISlider!
    
    
    @IBAction func addField(_ sender: UIButton) {
        if (addName.text != "")
            && (addAge.text != "")
            && (addSex.text != "")
            && (labelWeightPoint.text != "")
            && (labelHeightPoint.text != "")
            && (labelBMIresult.text != "")
        {
            saveData().self
            addName.text = ""
            addAge.text = ""
            addSex.text = ""
            labelWeightPoint.text = ""
            labelHeightPoint.text = ""
            
            //self.tabBarController?.selectedIndex =
        }
    }
    
    func saveData() {
        let key = ref.childByAutoId().key
        let persona = ["name": addName.text! as String,
                      "age": addAge.text! as String,
                      "gender": addSex.text! as String,
                      "weight": labelWeightPoint.text! as String,
                      "height": labelHeightPoint.text! as String,
                      "bmi": labelBMIresult.text! as String]
        ref.child(key!).setValue(persona)
    }
    
    
    
    var weight: Float = 80.0
    var height: Float = 1.8
    var image: UIImage = #imageLiteral(resourceName: "normal")
    
    var bmi: Float {
        return weight / (height * height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("Persona")
        sliderWeight.value = weight
        sliderHeight.value = height
            
        
        doCalculate()
        // Do any additional setup after loading the view.
        
    }
        func doCalculate() {
            if weight > 1 && height > 0 {
                // do calclutate
                self.labelWeightPoint.text = String(format: "%.1f", weight)
                self.labelHeightPoint.text = String(format: "%.1f", height)
                self.labelBMIresult.text = String(format: "%.1f", bmi)
                
                if let category = categorizer.checkCategory(bmi: self.bmi) {
                    self.labelSummary.text = category.categoryTitle
                    self.labelSummary.textColor = category.categoryColor
                    // image
                    self.imageBMI.image = category.image
                }
            }
         }
    
    @IBAction func toggleAction(_ sender: UISwitch) {
        if toggleoutlet.isOn {
                   //If text is already there, convert it to metric
                   if labelHeightPoint.text != nil && !((labelHeightPoint.text!).isEmpty) {
                       if let heightVal = Double(labelHeightPoint.text!) {
                           labelHeightPoint.text = String(format: "%.2f", heightVal * 0.0254)
                       }
                   }
                   if labelWeightPoint.text != nil && !((labelWeightPoint.text!).isEmpty) {
                       if let weightVal = Double(labelWeightPoint.text!) {
                           labelWeightPoint.text = String(format: "%.2f", weightVal * 0.453592)
                       }
                   }
                  
                   else if lastCalculationType == 0 && labelHeightPoint.text != nil && !((labelHeightPoint.text!).isEmpty) && labelWeightPoint.text != nil && !((labelWeightPoint.text!).isEmpty) {
                       doCalculate()
                   }
                   heightlabel.text = "(m)"
                   weightlabel.text = "(kg)"
               }
               else {
                   //If text is already there, convert it to imperial
                   if labelHeightPoint.text != nil && !((labelHeightPoint.text!).isEmpty) {
                       if let heightVal = Double(labelHeightPoint.text!) {
                           labelHeightPoint.text = String(format: "%.2f", heightVal / 0.0254)
                       }
                   }
                   if labelWeightPoint.text != nil && !((labelWeightPoint.text!).isEmpty) {
                       if let weightVal = Double(labelWeightPoint.text!) {
                           labelWeightPoint.text = String(format: "%.2f", weightVal / 0.453592)
                       }
                   }
                   else if lastCalculationType == 0 && labelHeightPoint.text != nil && !((labelHeightPoint.text!).isEmpty) && labelWeightPoint.text != nil && !((labelWeightPoint.text!).isEmpty) {
                       doCalculate()
                   }
            heightlabel.text = "(in)"
            weightlabel.text = "(lbs)"
               }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderWeightChange(_ sender: Any)
        
    {
        weight = sliderWeight.value
        
        print(weight)
        // calcluate
        doCalculate()
        
        
    }
    
    @IBAction func sliderHeightChange(_ sender: Any)
    {
        height = sliderHeight.value
        
        print(height)
        // calculate
        doCalculate()
    }
    
    
    @IBAction func segmentThemeChanged(_ sender: Any) {
//        switch segmentTheme.selectedSegmentIndex {
//        case 0:
//            lightMode()
//        case 1:
//            darkMode()
//        default:
//            darkMode()
//        }
//
    }
    
//    func darkMode() {
//        mainView.backgroundColor = UIColor.black
//        // change all labels text color to white
//        for label in labels {
//            label.textColor = UIColor.white
//        }
//    }
//    func lightMode() {
//        mainView.backgroundColor = UIColor.white
//        // change all labels text color to black
//        for label in labels {
//            label.textColor = UIColor.black
//        }
//    }
}



