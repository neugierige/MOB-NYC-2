
import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var names : [String] {
        get {
            let path = NSBundle.mainBundle().pathForResource("beatles", ofType: "plist")
            
            println(path)
            var beatles = NSArray(contentsOfFile: path!)
            return beatles as [String]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameCell") as UITableViewCell
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
}

