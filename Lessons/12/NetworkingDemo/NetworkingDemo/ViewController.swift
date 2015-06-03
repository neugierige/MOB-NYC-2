
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textView: UITextView!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let urlText = textField.text
        let url = NSURL(string: urlText)!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            
            var string = NSString(data: data, encoding: NSUTF8StringEncoding)!
            dispatch_async(dispatch_get_main_queue(), {
                self.textView.text = string
            })
            
        })
        task.resume()
        return true
    }

}

