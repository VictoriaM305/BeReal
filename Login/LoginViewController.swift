//
//  LoginViewController.swift
//  lab-insta-parse
//
//  Created by Victoria McKinnie on 09/29/2024.
//

import UIKit
import ParseSwift // Ensure ParseSwift is imported

// Define your User model based on ParseUser
struct User: ParseUser {
    var emailVerified: Bool?
    
    var authData: [String : [String : String]?]?
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    var username: String?
    var email: String?
    var password: String?
}

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLoginTapped(_ sender: Any) {
        // Hardcoded username and password
        let username = "Victoria"
        let password = "password"

        // Log in the parse user
        User.login(username: username, password: password) { result in
            switch result {
            case .success(let user):
                print("Logged in successfully as: \(user)")
                // Perform segue to the next screen after successful login
                self.performSegue(withIdentifier: "showFeedSegue", sender: nil)
            case .failure(let error):
                // Show alert if login failed
                print("Login failed with error: \(error.localizedDescription)")
                self.showAlert(description: error.localizedDescription)
            }
        }
    }

    // Function to show an alert if login fails
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    // Function to show an alert if fields are missing
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Oops...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

