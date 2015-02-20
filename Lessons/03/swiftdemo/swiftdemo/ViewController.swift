
import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        let name = nameField.text
        
        let welcomeMessage = sayHelloTo(name, day: "Thursday")
        
        messageLabel.text = welcomeMessage
        
        if(name.isEmpty) {
            messageLabel.backgroundColor = UIColor.redColor()
        } else {
            messageLabel.backgroundColor = UIColor.clearColor()
        }
        
        NSLog(welcomeMessage)
    }
    
    func sayHelloTo(name: String, day: String) -> String {
        return "hello \(name), have a good \(day)!"
    }
}

