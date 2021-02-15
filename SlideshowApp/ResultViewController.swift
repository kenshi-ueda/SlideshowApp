//２つ目の画面

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
   
    var image:UIImage!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        imageView.image = image
    }
    
}
