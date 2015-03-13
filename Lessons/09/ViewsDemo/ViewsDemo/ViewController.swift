import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button = UIButton(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
        button.setTitle("hello", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.redColor()
        self.view.addSubview(button)
        
        var blueView = UIView(frame: CGRect(x: 50, y: 50, width: 10, height: 50))
        blueView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueView)
        
    }
    
    @IBAction func loadRandomViews(sender: AnyObject) {
        for i in 1...10 {
            
            let randomView = UIView(frame: getRandomFrame())
            randomView.alpha = 0
            randomView.backgroundColor = UIColor.purpleColor()
            
            let interval = Double(i) + 0.5
            self.view.addSubview(randomView)

            UIView.animateWithDuration(interval, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                randomView.alpha = 1
                randomView.frame = self.getRandomFrame()
            }, completion: nil)
        }
    }
    
    func getRandomFrame() -> CGRect {
        let randomX = Int(arc4random_uniform(300))
        let randomY = Int(arc4random_uniform(500))
        let randomWidth = Int(arc4random_uniform(60))
        let randomHeight = Int(arc4random_uniform(60))
        
        return CGRect(x: randomX, y: randomY, width: randomWidth, height: randomHeight)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == UIEventSubtype.MotionShake {
            removeAllChildren()
            loadRandomViews("")
        }
    }
    
    func removeAllChildren() {
        let children = self.view.subviews
        for child in children {
            child.removeFromSuperview()
        }
    }
}

