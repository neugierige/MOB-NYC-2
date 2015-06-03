import UIKit

class ImageLoaderViewController: UIViewController,
UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func loadImage(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var textField: UITextField!
    @IBAction func resignFocus(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    @IBAction func tapped(sender: AnyObject) {
        loadImage("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var notify = NSNotificationCenter.defaultCenter()
        
        notify.addObserver(self, selector: Selector("kbStuffHappened:"), name: UIKeyboardWillShowNotification, object: nil)
        
        notify.addObserver(self, selector: Selector("kbStuffHappened:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    @IBOutlet weak var resignButton: UIButton!
    func keyboardWillShow(notification : NSNotification){
        resignButton.backgroundColor = UIColor.blueColor()
    }

    func keyboardWillHide(notification : NSNotification){
        resignButton.backgroundColor = UIColor.clearColor()
    }
    
    func kbStuffHappened(notification : NSNotification){
        if notification.name == UIKeyboardWillHideNotification {
            resignButton.backgroundColor = UIColor.clearColor()
        } else if notification.name == UIKeyboardWillShowNotification {
            resignButton.backgroundColor = UIColor.blueColor()
        }
    }
}
     








