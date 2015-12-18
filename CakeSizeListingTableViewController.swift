//
//  CakeSizeListingTableViewController.swift
//  BakeURDream Quote Manager
//
//  Created by Koithara on 12/15/15.
//  Copyright © 2015 Koithara. All rights reserved.
//

import UIKit
import Parse

class CakeSizeListingTableViewController: UITableViewController,UINavigationControllerDelegate {
    var listCakeSize = [Int]()
    var listCakeShape = [String]()
    var listNumberOfServings = [Int]()
    var numberOfRows = 0
    
   

   // var cakeDictionary:Dictionary
    
    
    @IBOutlet var listCakeProperties: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getCakeProperties()
        
               // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
        
    }
  
    func getCakeProperties()
    {
      let cakeQuery:PFQuery = PFQuery(className: "Cake")
        cakeQuery.selectKeys(["shape","size","servingSize"])
       // let Cakes = PFObject(className: "Cake")
       self.listCakeSize = [Int]()
        cakeQuery.findObjectsInBackgroundWithBlock {(Cakes, error) -> Void in
            if ((error != nil) || (Cakes == nil)){
                print("The get object failed")
            }
            else
            {
                
                print("Successfully retrieved the object")
        self.numberOfRows = 0
        for cakeObject in Cakes! {
                              print("cakeObject : \(self.numberOfRows++)")
                                let cakeSiZe:Int? = (cakeObject as PFObject)["size"] as? Int
                                self.listCakeSize.append(Int(cakeSiZe!))
            
                                let cakeShape:String? = (cakeObject as PFObject)["shape"] as? String
                                self.listCakeShape.append(String(cakeShape!))
            
                                let ServingNumber:Int? = (cakeObject as PFObject)["servingSize"] as? Int
                                self.listNumberOfServings.append(Int(ServingNumber!))
            
            
                }
                self.listCakeProperties.reloadData()
               
                
            }
            print("size array:\(self.listCakeSize)")
            print("Shape array:\(self.listCakeShape)")
            print("Number of sernings:\(self.listNumberOfServings)")
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
     return listCakeSize.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cakesizedisplay", forIndexPath: indexPath)
        
       cell.textLabel?.text = "\(listCakeSize[indexPath.row])\" \(listCakeShape[indexPath.row])"
        cell.detailTextLabel!.text = "Serves:\(listNumberOfServings[indexPath.row])"
        
       return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "editCakeSize"){
            let toeditcakesize = segue.destinationViewController as! EditCakeSizeViewController
            let toeditcakeshape = segue.destinationViewController as! EditCakeSizeViewController
            let toeditcakenumber = segue.destinationViewController as! EditCakeSizeViewController
            let indexPath = (listCakeProperties.indexPathForCell(sender as! UITableViewCell))!.row
            toeditcakesize.cakesizevalue = listCakeSize[indexPath]
            toeditcakeshape.cakeshapevalue = listCakeShape[indexPath]
            toeditcakenumber.cakenumbervalue = listNumberOfServings[indexPath]
            
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
