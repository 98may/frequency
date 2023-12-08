import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        titleLabel.text = ""
//        let titleText = "Frequency" // Your Frequency Tracker
//        self.titleLabel.text?.append(titleText)
       
        super.viewDidLoad()
                titleLabel.text = ""
                var timerDelay = 0.0
                let titleText = "Frequency"
                for letter in titleText {
                    Timer.scheduledTimer(withTimeInterval: 0.1 * timerDelay, repeats: false) { (timer) in
                        self.titleLabel.text?.append(letter)
                    }
                    timerDelay += 1
                }
    }
    

}
