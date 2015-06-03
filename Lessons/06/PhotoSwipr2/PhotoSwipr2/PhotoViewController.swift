import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousScoreSlider: UISlider!
    @IBOutlet weak var previousRatingLabel: UILabel!
    @IBOutlet weak var previousCommentField: UITextField!
    
    var photoRatings = [String:PhotoProperties]()
    var fileName = "Unknown"
    
    @IBAction func nextImageRequested(sender: AnyObject)
    {
        var photoProps = PhotoProperties()
        photoProps.comment = previousCommentField.text
        photoProps.score = previousScoreSlider.value
        photoProps.filename = fileName
        photoRatings[fileName] = photoProps
        
        showNextRandomImage()
    }
    
    func showNextRandomImage() {
        let randomInt = arc4random_uniform(10) + 1
        fileName = randomInt < 10 ? "0\(randomInt).jpg" : "\(randomInt).jpg"
        imageView.image = UIImage(named: fileName)
        
        var photoProps = photoRatings[fileName]
        if photoProps == nil {
            previousRatingLabel.text = "Unrated"
            previousCommentField.text = "No comment"
            previousScoreSlider.value = 0.0
        } else {
            var p = photoProps!
            previousRatingLabel.text = photoProps?.rating
            previousCommentField.text = photoProps?.comment
            previousScoreSlider.value = p.score
        }
    }
    @IBAction func leftSwiped(sender: AnyObject) {
        var photoProps = PhotoProperties()
        photoProps.rating = "hated it"
        photoProps.comment = previousCommentField.text
        photoProps.score = previousScoreSlider.value
        photoProps.filename = fileName
        photoRatings[fileName] = photoProps
        
        showNextRandomImage()

    }
    
    @IBAction func rightSwiped(sender: AnyObject) {
        var photoProps = PhotoProperties()
        photoProps.rating = "loved it"
        photoProps.comment = previousCommentField.text
        photoProps.score = previousScoreSlider.value
        photoProps.filename = fileName
        photoRatings[fileName] = photoProps
        
        showNextRandomImage()

    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
//        if motion.rawValue == UIEventSubtype.MotionShake {
//            showNextRandomImage()
//        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var tableVC = segue.destinationViewController as AllRatingsTableViewController
        
        tableVC.ratings = photoRatings.values.array
    }

}

