import UIKit

class ViewController: UIViewController {

    @IBAction func getStarted(sender: AnyObject) {
        let settings = NSUserDefaults.standardUserDefaults()
        
        if let token = settings.stringForKey("fbToken") {
            performSegueWithIdentifier("login", sender: nil)
        } else {
            PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile"], block: { (user, error) -> Void in
                if let user = user {
                    let token = FBSDKAccessToken.currentAccessToken().tokenString
                    settings.setObject(token, forKey: "fbToken")
                    self.performSegueWithIdentifier("login", sender: nil)
                } else {
                    println("user cancelled; didn't get a token")
                }
            })
        }
    }
}














