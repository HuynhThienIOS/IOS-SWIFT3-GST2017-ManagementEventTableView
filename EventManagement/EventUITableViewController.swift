//
//  EventUITableViewController.swift
//  EventManagement
//
//  Created by Cntt15 on 4/22/17.
//  Copyright © 2017 Cntt15. All rights reserved.
//

import UIKit

class EventUITableViewController: UITableViewController {

   
    // MARK: - Data Source
    var dayEvents: [DayEvent] = {
        return DayEvent.dayEvents()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dayEvent = dayEvents[section]
        return dayEvent.day
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dayEvents.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let dayEvent = dayEvents[section]
        return dayEvent.events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Event Cell", for: indexPath) as! EventTableViewCell
        
        let dayEvent = dayEvents[indexPath.section]
        let event = dayEvent.events[indexPath.row]
        
        cell.labelTitle?.text = event.title
        cell.labelContent?.text = event.content

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Detail":
                let eventDetail = segue.destination as! EventDetailUIViewController
                if let indexPath = self.tableView.indexPath(for: sender as! EventTableViewCell) {
                    eventDetail.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
                }
            default:
                break
            }
        }
    }
    
    // MARK: - Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dayEvents[indexPath.section].events.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Get event method
    func eventAtIndexPath(indexPath: NSIndexPath) -> Event {
        let dayEvent = dayEvents[indexPath.section]
        return dayEvent.events[indexPath.row]
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
   
 

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let event = dayEvents[fromIndexPath.section].events[fromIndexPath.row]
        dayEvents[fromIndexPath.section].events.remove(at: fromIndexPath.row)
        
        if fromIndexPath.section == to.section {
            dayEvents[fromIndexPath.section].events.insert(event, at: to.row)
        }else {
            dayEvents[to.section].events.insert(event, at: to.row)
        }
       
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
