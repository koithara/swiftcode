//
//  CostCalculatorViewController.swift
//  BakeURDream Quote Manager
//
//  Created by Koithara on 12/15/15.
//  Copyright © 2015 Koithara. All rights reserved.
//

import UIKit

class CostCalculatorViewController: UIViewController {
    var cakeshapevalue = String()
    var cakesizevalue = Int()
    var cakenumbervalue = Int()
    var cakeflavour = String()
    var cakeprice = Float()

    
    @IBOutlet weak var selectedSize: UILabel!
    @IBOutlet weak var serves: UILabel!
    @IBOutlet weak var selectedShape: UILabel!
    @IBOutlet weak var selectedFlavor: UILabel!
    
    @IBOutlet weak var result: UITextField!
   var tempsize = Int()
    var tempshape =  String()
    var tempserve = Int()
    var tempflavour = String()
    var tempprice = Float()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempserve = cakenumbervalue
        tempprice = cakeprice
        
        selectedSize.text = String(cakesizevalue)
        selectedShape.text = cakeshapevalue
        serves.text = String(cakenumbervalue)
        selectedFlavor.text = cakeflavour
    }
   
    
    
    @IBAction func CalculateCost(sender: UIButton) {
        let results = Int(tempprice) * Int(tempserve)
        result.text = String(results)
        
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
