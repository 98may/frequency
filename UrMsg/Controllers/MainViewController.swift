import UIKit
import SwiftUI
import Firebase

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the view's properties
        view.backgroundColor = .white // Set the background color or any other properties

        // Initialize your SwiftUI view
        let swiftUIView = MainView()

        // Use a UIHostingController to wrap your SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)

        // Make sure the hosting controller's view will resize correctly
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        // Add the SwiftUI view as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        // Set up constraints for the hosting controller's view
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
