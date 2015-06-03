
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonFromStoryboard: UIButton!
    
    var myCustomButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myCustomButton = UIButton(frame: CGRect(x: 30, y: 30, width: 60, height: 30))
        myCustomButton?.setTitle("Custom", forState: UIControlState.Normal)
        myCustomButton?.backgroundColor = UIColor.blackColor()
        self.view.addSubview(myCustomButton!)
        
        myCustomButton?.addTarget(self, action: "customClicked", forControlEvents: UIControlEvents.TouchUpInside)
    }

    func customClicked() {
        NSLog("Custom button clicked")
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        NSLog("button clicked")
    }


}

