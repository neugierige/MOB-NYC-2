import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var passedInName = "Unknown"
    override func viewDidLoad() {
        greetingLabel.text = "hello \(passedInName)"
    }
    
    @IBAction func thanksButtonClicked(sender: AnyObject) {
//        if sender is UIButton {
//        var button = sender as UIButton
//        button.setTitle("hey", forState: UIControlState.Normal)
//        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
