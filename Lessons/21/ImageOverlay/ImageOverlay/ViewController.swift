import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    let globalOverlayImageView = UIImageView(image: UIImage(named: "One.png")!)

    @IBAction func buttonClicked(sender: UIButton) {
//        let text = UILabel()
//        text.text = "Hi chritine!"
//        text.backgroundColor = UIColor.redColor()
//        imageView.addSubview(text)
//        text.frame = CGRect(x: 30, y: 30, width: 70, height: 30)
        
        let image = UIImage(named: "\(sender.titleLabel!.text!).png")
        let overlayImageView = UIImageView(image: image!)
        imageView.addSubview(overlayImageView)
        overlayImageView.frame = CGRect(x: 70, y: 100, width: 50, height: 50)
//        overlayImageView.frame = CGRect(origin: CGPoint(x: 70,y: 100),size: CGSize(width: 50,height: 50))
    }
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Ended {
            let image = UIImage(named: "One.png")
            let overlayImageView = UIImageView(image: image!)
            imageView.addSubview(overlayImageView)
    
//            overlayImageView.frame = CGRect(origin: sender.locationInView(imageView), size: image!.size)
            overlayImageView.center = sender.locationInView(imageView)
        }
    }

    @IBAction func dragged(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Began:
            imageView.addSubview(globalOverlayImageView)
            globalOverlayImageView.center = sender.locationInView(imageView)
        case .Changed:
            globalOverlayImageView.center = sender.locationInView(imageView)
        default:
            println("at least one executatble statement")
            //do nothing
        }
    }
}