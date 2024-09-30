//
//  SignUpViewController.swift
//  lab-insta-parse
//
//  Created by Victoria McKinnie on 09/29/2024.
//

import UIKit
import ParseSwift

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onSignUpTapped(_ sender: Any) {
        // Hardcoded username, email, and password
        let username = "Victoria"
        let email = "Victoria.mckinnie305@yahoo.com"
        let password = "password"

        // Create a new User object
        var newUser = User()
        newUser.username = username
        newUser.email = email
        newUser.password = password

        // Sign up the user
        newUser.signup { result in
            switch result {
            case .success(let user):
                print("Signed up successfully as: \(user)")
                // Perform segue to the next screen after successful signup
                self.performSegue(withIdentifier: "showFeedSegue", sender: nil)
            case .failure(let error):
                print("Sign up failed: \(error.localizedDescription)")
                self.showAlert(description: error.localizedDescription)
            }
        }
    }

    // Function to show an alert if signup fails
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Sign Up", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    // Function to show an alert if fields are missing
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Oops...", message: "We need all fields filled out in order to sign you up.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

