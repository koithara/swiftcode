//
//  AddNewCakeSizeViewController.swift
//  BakeURDream Quote Manager
//
//  Created by Koithara on 12/15/15.
//  Copyright © 2015 Koithara. All rights reserved.
//

import UIKit
import Parse

class AddNewCakeSizeViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    @IBOutlet weak var CakeSize: UITextField!

    @IBOutlet weak var numberOfServings: UITextField!
    @IBOutlet weak var AddNewCakeSize: UIPickerView!
    var CakeShape = ["Round","Square"]
    var Selectedrow = 0
    var SelectedShape: String?
    var Size: Int?
    var ServingNumber: Int?
    
    
   
    override func viewDidLoad() {
        
        AddNewCakeSize.delegate = self
        AddNewCakeSize.dataSource = self
        CakeSize.delegate = self
        numberOfServings.delegate = self
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CakeShape[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CakeShape.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func getDataFromFields()
    {
        SelectedShape = CakeShape[Selectedrow]
        Size = Int(CakeSize.text!)!
        ServingNumber = Int(numberOfServings.text!)!
    
    }
    func checkHasEmptyField()->Bool
    {
        if(Size != 0 ) && (ServingNumber != 0)
        {
            return true
        }
        else
        {
            return false
        }
    }
    let CakeDetails = PFObject(className: "Cake")
    
    @IBAction func AddCakeSize(sender: UIButton) {
        self.CakeSize.resignFirstResponder()
        self.numberOfServings.resignFirstResponder()
        getDataFromFields()
       let checkValue = checkHasEmptyField()
        if(checkValue)
        {
        
        CakeDetails["size"] = Size
        CakeDetails["shape"] = SelectedShape
        CakeDetails["servingSize"] = ServingNumber
        
        CakeDetails.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
            }
        }
        else{
                print("Empty field")
            }
  
    }
       
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Selectedrow = row
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
