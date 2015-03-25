import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var content : String?
    var URL : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = content
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var webVC = segue.destinationViewController as WebViewController
        webVC.URL = self.URL
    }


}
