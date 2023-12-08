import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }

                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let mainVC = MainViewController()
                    mainVC.modalPresentationStyle = .fullScreen // For full-screen presentation
                    strongSelf.present(mainVC, animated: true, completion: nil)
                }
            }
        }
    }

}
