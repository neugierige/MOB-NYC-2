import UIKit

class AllRatingsTableViewController: UITableViewController {
    var ratings = [PhotoProperties]()
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratings.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = ratings[indexPath.row].filename
        cell.detailTextLabel?.text = ratings[indexPath.row].rating

        return cell
    }
    }
