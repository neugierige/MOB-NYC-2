
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dayOfWeek: UITextField!
    
    let settings = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateName()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateName", name: NSUserDefaultsDidChangeNotification, object: nil)
        
        
        settings.setValue("tuesday", forKey: "today")
        
        let day = settings.stringForKey("today")
        
        dayOfWeek.text = day
    }

    func updateName(){
        let name = settings.stringForKey("name_preference")
        
        nameField.text = name
    }

    @IBAction func showSettings(sender: AnyObject) {
        let settingsURL = UIApplicationOpenSettingsURLString
        
        UIApplication.sharedApplication().openURL(NSURL(string: settingsURL)!)
        
    }
    
}




