
import UIKit

class AutoLayoutViewController: UIViewController {

    @IBOutlet weak var buttonFromStoryboard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var button = UIButton()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        button.setTitle("Button", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.clearColor()
        button.layer.borderWidth = 1
        
        let centerXRule = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: -90)
        
        let centerYRule = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: buttonFromStoryboard, attribute: .Bottom, multiplier: 1, constant: 0)

        self.view.addSubview(button)
        self.view.addConstraints([centerXRule, centerYRule])
    }
}









