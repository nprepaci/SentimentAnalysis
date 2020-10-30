//
//  ViewController.swift
//  SentimentAnalysis
//
//  Created by Nicholas Repaci on 10/28/20.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var sentimentLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let swifter = Swifter(consumerKey: SecretConstants.apiKey, consumerSecret: SecretConstants.secretApiKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    
    
    func searchTweet() {
        swifter.searchTweet(using: "@apple") { (results, metadata) in
            print(results)
        } failure: { (error) in
            print("There was an errror with the twitter API request \(error)")
        }

    }
}

