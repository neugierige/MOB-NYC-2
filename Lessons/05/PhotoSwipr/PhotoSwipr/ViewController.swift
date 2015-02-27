import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousRatingField: UILabel!
    @IBOutlet weak var imageNameField: UILabel!
    @IBOutlet weak var scoreSlider: UISlider!
    @IBOutlet weak var commentField: UITextField!
    
    var previousRatings = [String:PhotoProperties]()
    var imageName = "Unknown"
    
    class PhotoProperties {
        var rating : Rating
        var comment : String
        var score : Float
        
        init(rating : Rating, comment : String, score : Float){
            self.rating = rating
            self.comment = comment
            self.score = score
        }
    }
    
    @IBAction func nextImageClicked(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Unknown, comment: commentField.text, score: scoreSlider.value)
        previousRatings[imageName] = newPhotoProperties

        showNextRandomImage()
    }
    
    @IBAction func swipedLeft(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Dislike, comment: commentField.text, score: scoreSlider.value)
        previousRatings[imageName] = newPhotoProperties
        showNextRandomImage()
    }
    
    @IBAction func swipedRight(sender: AnyObject) {
        var newPhotoProperties = PhotoProperties(rating: Rating.Like, comment: commentField.text, score: scoreSlider.value)

        previousRatings[imageName] = newPhotoProperties
        showNextRandomImage()
    }
    
    func showNextRandomImage() {
        let randomNumber = arc4random_uniform(10) + 1
        imageName = randomNumber < 10 ? "0\(randomNumber).jpg" : "\(randomNumber).jpg"
        imageView.image = UIImage(named: imageName)
        
        imageNameField.text = imageName
        
        if let previousRating = previousRatings[imageName] {
            previousRatingField.text = previousRating.rating.getDescription()
            scoreSlider.value = previousRating.score
            commentField.text = previousRating.comment
        } else {
            previousRatingField.text = Rating.Unknown.getDescription()
            scoreSlider.value = 0.0
            commentField.text = ""
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextRandomImage()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if (motion == UIEventSubtype.MotionShake) {
            showNextRandomImage()
        }
    }
    
}







