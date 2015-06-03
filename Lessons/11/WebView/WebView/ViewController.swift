
import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    @IBOutlet weak var newsSelector: UISegmentedControl!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func newsSourceChanged(newsSelector: UISegmentedControl) {
        switch newsSelector.selectedSegmentIndex {
        case 0: loadURL("http://nyt.com")
        case 1: loadURL("http://cnn.com")
        case 2: loadURL("http://fnc.com")
        default: break
        }
    }

    func loadURL(urlToLoad : String) {
        let url = NSURL(string: urlToLoad)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        loadURL(textField.text)
        textField.resignFirstResponder()
        newsSelector.selectedSegmentIndex = -1
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        spinner.stopAnimating()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        spinner.startAnimating()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
}

