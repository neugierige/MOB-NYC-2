import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var mashableStories : NSArray?
    var refreshControl : UIRefreshControl?
    var currentURL : String?
    var currentContent : String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromMashable()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "loadDataFromMashable", forControlEvents: UIControlEvents.ValueChanged)
        
        self.tableView.addSubview(refreshControl!)
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let child = mashableStories![indexPath.row] as NSDictionary
        
        
        currentURL = child["link"] as String?
        let contentDictionary = child["content"] as NSDictionary
        currentContent = contentDictionary["plain"] as String?
        performSegueWithIdentifier("showContent", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var contentVC = segue.destinationViewController as ContentViewController
            
        contentVC.URL = currentURL
        contentVC.content = currentContent
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mashableStories == nil {
            return 0
        } else {
            return mashableStories!.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("redditCell") as UITableViewCell
        
        let child = mashableStories![indexPath.row] as NSDictionary
        
        let title = child["title"] as String
        let author = child["author"] as String

        cell.imageView?.image
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = author
        return cell
    }
    
    func loadDataFromMashable() {
        let url = NSURL(string: "http://mashable.com/stories.json")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as NSDictionary
            
            self.mashableStories = responseDictionary["new"] as NSArray?
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            })
        })
        task.resume()
    }
}

