//
//  ListTableViewController.swift
//  funbuy
//
//  Created by romichama on 5/14/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ListTableViewController: PFQueryTableViewController {

    
   

    
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "ListaCompra"
        self.textKey = "nombreListaCompra"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery{
        var query = PFQuery(className: "ListaCompra")
       // query.fromLocalDatastore()
        query.orderByAscending("nombreListaCompra")
        query.whereKey("habilita", equalTo:true)
       // query.hasCachedResult(true)
        return query
    }
    
    
    @IBAction func add(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("TableViewToDetailView", sender: self)
            
            
                 }
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        //var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as ListCustomCell
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ListCustomCell!
        
        if cell == nil {
            cell = ListCustomCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ListCustomCell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let nombrelc = object?["nombreListaCompra"] as? String {
            cell.nListaCompra.text = nombrelc
        }
        
        if let descripcionlc = object?["descripcionListaCompra"] as? String {
            cell.dListaCompra.text = descripcionlc
        }
        
        // Display flag image
        var initialThumbnail = UIImage(named: "question")
        cell.iListaCompra.image = initialThumbnail
        if let thumbnail = object?["imgListaCompra"] as? PFFile {
            cell.iListaCompra.file = thumbnail
            cell.iListaCompra.loadInBackground()
        }
        
        
        return cell
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as! DetalleList
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects?[row] as! PFObject
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Refresh the table to ensure any data changes are displayed
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let objectToDelete = objects?[indexPath.row] as! PFObject
            objectToDelete.deleteInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // Force a reload of the table - fetching fresh data from Parse platform
                    self.loadObjects()
                } else {
                    // There was a problem, check error.description
                }
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    

    
    
}
