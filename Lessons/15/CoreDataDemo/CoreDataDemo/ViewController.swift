import CoreData
import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    var students = [NSManagedObject]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadStudents()
    }

    @IBAction func addStudent(sender: AnyObject) {
        var alert = UIAlertController(title: "Add Student", message: "Enter name below", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Student name"
        }
        
        var saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action) -> Void in
            let name = (alert.textFields![0] as! UITextField).text
            
            let student: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: self.managedContext)
            
            student.setValue(name, forKey: "name")
            
            self.managedContext.save(nil)
            
            self.loadStudents()
            self.tableView.reloadData()
            
        }
        
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func loadStudents() {
        let fetchRequest = NSFetchRequest(entityName: "Student")
        
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]?{
            students = fetchResults
        }
    }
    
    
    func sortStudents(asc: Bool){
        let fetchRequest = NSFetchRequest(entityName: "Student")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: asc)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]?{
            students = fetchResults
        }
        
        tableView.reloadData()
    }
    
    @IBAction func sortOptions(sender: AnyObject) {
        var sortOptions = UIAlertController(title: "Sort", message: "Select sort options", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let asc = UIAlertAction(title: "Ascending", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.sortStudents(true)
        }
        
        let desc = UIAlertAction(title: "Descending", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.sortStudents(false)
        }
        
        sortOptions.addAction(asc)
        sortOptions.addAction(desc)
        sortOptions.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(sortOptions, animated: true, completion: nil)
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        loadStudents()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchTerm = searchBar.text
        let fetchRequest = NSFetchRequest(entityName: "Student")
        let searchPredicate = NSPredicate(format: "name == %@", searchTerm)
        fetchRequest.predicate = searchPredicate
        
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]?{
            students = fetchResults
        }
        
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("nameCell") as! UITableViewCell
        
        let student = students[indexPath.row]
        cell.textLabel!.text = student.valueForKey("name") as! String?
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let student = students[indexPath.row]
            
            students.removeAtIndex(indexPath.row)
            
            managedContext.deleteObject(student)
            managedContext.save(nil)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

        }
    }

}

