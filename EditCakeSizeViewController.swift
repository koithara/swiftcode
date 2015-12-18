//
//  EditCakeSizeViewController.swift
//  BakeURDream Quote Manager
//
//  Created by Koithara on 12/15/15.
//  Copyright © 2015 Koithara. All rights reserved.
//

import UIKit
import Parse

class EditCakeSizeViewController: UIViewController{

    @IBOutlet weak var editcakenumber: UITextField!
    @IBOutlet weak var editcakesize: UITextField!
   
    
    @IBOutlet weak var editcakeshape: UITextField!
    var cakeshapevalue: String?
    var cakesizevalue: Int?
    var cakenumbervalue: Int?
    var temp: String?
    //var CakeShapeArray = ["Round","Square"]
    override func viewDidLoad() {
        super.viewDidLoad()
        editcakesize.text = String(cakesizevalue!)
        editcakenumber.text = String(cakenumbervalue!)
        editcakeshape.text = cakeshapevalue
        temp = cakeshapevalue
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func deleteSize(sender: AnyObject) {
            let cakeQuery:PFQuery = PFQuery(className: "Cake")
            cakeQuery.whereKey("size", equalTo: (editcakesize.text)!)
        cakeQuery.whereKey("shape", equalTo: (editcakeshape.text)!)
        cakeQuery.findObjectsInBackgroundWithBlock {(Cakes, error) -> Void in
            if ((error != nil) || (Cakes == nil)){
                print("The get object failed")
            }
            else
            {
                   for cakeObject in Cakes! {
                //  let cakeSiZe:Int? = (cakeObject as PFObject)["size"] as? Int
                   // let cakeShape:String? = (cakeObject as PFObject)["shape"] as? String
                  //  let ServingNumber:Int? = (cakeObject as PFObject)["servingSize"] as? Int
                    //if(cakeShape == self.temp){
                        print(self.temp)
                        cakeObject.deleteInBackground()
                   // }
                }
            }
            
                }
        
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
