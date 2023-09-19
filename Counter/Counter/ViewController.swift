import UIKit

class ViewController: UIViewController {
    
// MARK: - Связываем UI элементы из сториборда с view controller
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

