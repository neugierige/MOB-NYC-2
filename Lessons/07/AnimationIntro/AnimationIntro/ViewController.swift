
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var spaceBetweenLabelAndButton: NSLayoutConstraint!
   
    @IBAction func showImage(sender: AnyObject) {
        fadeInImage()
        slideDownBox()
    }
    
    func fadeInImage() {
        imageView.alpha = 0
        
        imageView.image = UIImage(named: "01.jpg")
        UIView.animateWithDuration(3, animations: {
            self.imageView.alpha = 1
        })
    }
    
    func slideDownBox() {
        UIView.animateWithDuration(2, animations: {
            self.spaceBetweenLabelAndButton.constant += 100
//            self.label.backgroundColor = UIColor.purpleColor()
            self.view.layoutIfNeeded()
        })
    }
}

