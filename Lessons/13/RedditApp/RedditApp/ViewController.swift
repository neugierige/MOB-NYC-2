import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var redditStories : JSON?
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "loadDataFromReddit", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl!)
        
        loadDataFromReddit()
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let url = redditStories!["data"]["children"][indexPath.row]["data"]["url"].stringValue
        
        performSegueWithIdentifier("navToWebView", sender: url)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is WebViewController {
        var webViewVC = segue.destinationViewController as WebViewController
        webViewVC.URL = sender as String?
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if redditStories == nil {
            return 0
        } else {
            return redditStories!["data"]["children"].arrayValue.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("redditCell") as UITableViewCell
        
        cell.textLabel?.text = redditStories!["data"]["children"][indexPath.row]["data"]["title"].stringValue
        
        cell.detailTextLabel?.text = redditStories!["data"]["children"][indexPath.row]["data"]["author"].stringValue
        
        let url = redditStories!["data"]["children"][indexPath.row]["data"]["thumbnail"].stringValue
        let request = NSURLRequest(URL: NSURL(string: url)!)
        
        cell.imageView?.image = nil
        cell.imageView?.cancelImageRequestOperation()
        
        cell.imageView?.setImageWithURLRequest(request, placeholderImage: nil, success: { [weak cell] (request, response, image) -> Void in
            cell!.imageView!.image = image
            cell!.setNeedsLayout()
            }, failure: nil)
        
        return cell
    }
    
    func loadDataFromReddit() {
        let url = NSURL(string: "http://www.reddit.com/.json")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            
            self.redditStories = JSON(data: data)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            })
        })
        task.resume()
    }
}

