
import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var imageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView()
        imageView!.image = UIImage(named: "75.jpg")
        imageView!.sizeToFit()
        
        scrollView.contentSize = imageView!.frame.size
        scrollView.addSubview(imageView!)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
