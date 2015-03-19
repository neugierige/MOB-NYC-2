
import UIKit

class TableUIViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    
    var storage = NSUserDefaults.standardUserDefaults()
    
    //var names = [String]()
    let storageKey = "names"
    
    var names : [String] {
        get {
//            if storage.arrayForKey(storageKey) is [String] {
//                var storedValue = storage.arrayForKey(storageKey) as [String]
//            }
//            
//            if storedValue == nil {
//                return [String]()
//            } else {
//                return storedValue!
//            }
            return storage.arrayForKey("names") as? [String] ?? [String]()
        }
        set {
            storage.setObject(newValue, forKey: storageKey)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as BlueCellTableViewCell
        
        cell.textLabel?.text = names[indexPath.row]
        cell.textValue?.text = "hello world"
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        names.append(nameField.text)
        tableView.reloadData()
        return true
    }
    
}

