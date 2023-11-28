import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        navigationController?.title = constantsContainer.appName
        tableView.register(UINib(nibName: constantsContainer.cellNibName, bundle: nil), forCellReuseIdentifier: constantsContainer.cellIdentifier)
        
        loadMessages()
        
    }
    
    
    func loadMessages(){
        db.collection(constantsContainer.FStore.collectionName)
            .order(by: constantsContainer.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            
            if let e = error {
                print("Error in retrieving data from FireStore \(e)")
            } else {
                if let snapShotDocs = querySnapshot?.documents {
                    for document in snapShotDocs {
                        let data = document.data()
                        if let messageSender = data[constantsContainer.FStore.senderField] as? String , let messageBody = data[constantsContainer.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath =  IndexPath(row: self.messages.count - 1, section: 0 )
                                // enable scrollable
                                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                            }
                            

                        }
                        
                    }
                }
                
                
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection(constantsContainer.FStore.collectionName).addDocument(data: [constantsContainer.FStore.senderField : messageSender ,
                constantsContainer.FStore.bodyField : messageBody ,
                constantsContainer.FStore.dateField : Date().timeIntervalSince1970 ]
            ) { (error) in
                if let e = error{
                    print("Error in fireStore , \(e)")
                }else {
                    print("Successfully saved Data")
                    
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                    
                }
            }
        }
        
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print (signOutError)
        }
        
    }
    
    
}



extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(constantsContainer.cellIdentifier)", for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        //message from Current User
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
        } else {
        //message from another User
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
//            cell.messageBubble.backgroundColor = UIColor(named: Blue)
//            cell.label.textColor = UIColor(named: kCGColorBlack)
        }

        return cell
    }
    
    
}
