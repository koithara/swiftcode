//
//  FlavourForCalculationTableViewController.swift
//  BakeURDream Quote Manager
//
//  Created by Koithara on 12/17/15.
//  Copyright © 2015 Koithara. All rights reserved.
//

import UIKit
import Parse


class FlavourForCalculationTableViewController: UITableViewController,UINavigationControllerDelegate {

    var cakeshapevalue: String?
    var cakesizevalue: Int?
    var cakenumbervalue: Int?
    var listCakeflavour = [String]()
    var listprice = [Float]()
    var numberOfRows = 0
    
    @IBOutlet var flavourTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCakeFlavours()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func getCakeFlavours()
    {
        let cakeQuery:PFQuery = PFQuery(className: "Flavour")
        cakeQuery.selectKeys(["PricePerServing","flavours"])
        // let flavour = PFObject(className: "Flavour")
        //  self.listCakeSize = [Int]()
        cakeQuery.findObjectsInBackgroundWithBlock {(flavour, error) -> Void in
            if ((error != nil) || (flavour == nil)){
                print("The get object failed")
            }
            else
            {
                
                print("Successfully retrieved the object")
                self.numberOfRows = 0
                for flavourObject in flavour! {
                    print("flavourObject : \(self.numberOfRows++)")
                    let price:Float? = (flavourObject as PFObject)["PricePerServing"] as? Float
                    self.listprice.append(Float(price!))
                    
                    let cakeflav:String? = (flavourObject as PFObject)["flavours"] as? String
                    self.listCakeflavour.append(String(cakeflav!))
                    
                    
                }
                self.flavourTable.reloadData()
                
            }
            print("Flavour array:\(self.listCakeflavour)")
            print("Price array:\(self.listprice)")
            
            print("Number of entry:\(self.numberOfRows)")
        }
        
        
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listCakeflavour.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cakeflavourcell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(listCakeflavour[indexPath.row])"
        cell.detailTextLabel!.text = "Price per serving: $\(listprice[indexPath.row])"

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "getflavour"){
            let getcakeflavor = segue.destinationViewController as! CostCalculatorViewController
           let getflavorprice = segue.destinationViewController as! CostCalculatorViewController
            
            let indexPath = (flavourTable.indexPathForCell(sender as! UITableViewCell))!.row
            getcakeflavor.cakeflavour = listCakeflavour[indexPath]
            getflavorprice.cakeprice = Float(listprice[indexPath])
            
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
