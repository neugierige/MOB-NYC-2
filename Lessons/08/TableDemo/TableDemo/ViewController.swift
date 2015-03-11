import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var rows = [String]()
//    var rows = ["john" : "vocals" , "ringo" : "drums", "paul" : "guitar", "george" : "bass"]
//    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
        
        NSURLSession.sharedSession().downloadTaskWithURL(NSURL(string: "http://google.com")!).resume()
        
    }

    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var topSpaceAboveTextField: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    @IBAction func addName(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
                self.topSpaceAboveTextField.constant += 40
                self.buttonWidth.constant += 30
                self.view.layoutIfNeeded()
            }, completion : { (finished) in
                UIView.animateWithDuration(0.2, animations: {
                    self.topSpaceAboveTextField.constant = 8
                    self.buttonWidth.constant = 140
                    self.nameField.text = ""
                    self.view.layoutIfNeeded()
                })
            }
        )
        
        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.CurveEaseOut
        
        UIView.animateWithDuration(0.5, delay: 0, options: options, animations: {
            self.tableView.backgroundColor = UIColor.grayColor()
            }, completion: { (finished) in
                self.tableView.backgroundColor = UIColor.clearColor()

        })
    
        rows.append(nameField.text)
        
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mycell") as UITableViewCell
        
//        let person = rows.keys.array[indexPath.row]
//        
//        cell.textLabel!.text = person
//        cell.detailTextLabel!.text = rows[person]
//        
        cell.textLabel!.text = rows[rows.count - 1 - indexPath.row]
        return cell
    }
}

