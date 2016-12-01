//
//  LogView.swift
//  Historicus
//
//  Created by Lance Walker on 7/10/15.
//  Copyright © 2015 Lance Walker. All rights reserved.
//

import Foundation
import UIKit

class LogView: UITableViewController, UISearchResultsUpdating {
        //Elements
    var swiftArray = LogArray as NSArray as! [String]
    var filteredDateStrings = [String]()
    var resultSearchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        tableView.separatorColor = UIColor.brownColor()

        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
    }
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let TotalLabel = UILabel()
        TotalLabel.textAlignment = NSTextAlignment.Center
        TotalLabel.text = "Hours: \(LogHours),   Minutes: \(LogMinutes),  Seconds: \(LogSeconds)" //Final Label
        TotalLabel.textColor = UIColor.whiteColor()
        TotalLabel.font = UIFont(name: "Papyrus", size: 20)
        TotalLabel.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(TotalLabel)
        
        return TotalLabel;
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return self.filteredDateStrings.count   //Search
            
        } else {
            return self.swiftArray.count    //Shows all objects
            
        }
    }
    
    //TableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        cell.textLabel?.font = UIFont(name: "Papyrus", size: 17);
        
        if (self.resultSearchController.active) {
            cell.textLabel?.text = self.filteredDateStrings[indexPath.row]
                                    
            return cell
        } else {
            cell.textLabel?.text = self.swiftArray[indexPath.row]

            return cell
        }
    }
    //Update tableview with seach
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredDateStrings.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.swiftArray as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredDateStrings = array as! [String]
        
        self.tableView.reloadData()
    }
    
}

