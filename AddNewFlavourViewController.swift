//
//  AddNewFlavourViewController.swift
//  BakeURDream Quote Manager
//
//  Created by Koithara on 12/16/15.
//  Copyright © 2015 Koithara. All rights reserved.
//

import UIKit
import Parse


class AddNewFlavourViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var cakeFlavour: UITextField!
    @IBOutlet weak var pricePerServing: UITextField!
    var Flavour: String?
    var price: Float?
    
    override func viewDidLoad() {
        cakeFlavour.delegate = self
        pricePerServing.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func getFlavour(){
        Flavour = cakeFlavour.text
        price = Float(pricePerServing.text!)!
        
    }
    func checkForEmptyField()->Bool
    {
        if Flavour?.isEmpty != nil{
            if(price != 0){
               return true
            }
            
            else{
                return false}
         
        }
            
        else
        {
            return false
        }
    }
    let CakeFlavour = PFObject(className: "Flavour")

    @IBAction func AddFlavour(sender: UIButton) {
        self.cakeFlavour.resignFirstResponder()
        self.pricePerServing.resignFirstResponder()
        getFlavour()
      //  let checkEmpty = checkForEmptyField()
        if(checkForEmptyField())
        {
            CakeFlavour["flavours"] = Flavour
            CakeFlavour["PricePerServing"] = price
            CakeFlavour.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Flavour and price added successfully")
            }
            
        }
        else{
            print("Empty fields")
        }

    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
