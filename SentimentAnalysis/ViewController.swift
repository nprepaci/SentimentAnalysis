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
    
    //you will need to register for a twitter developer account and replace my keys with your own keys
    let swifter = Swifter(consumerKey: SecretConstants.apiKey, consumerSecret: SecretConstants.secretApiKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        searchTweet()
        
    }
    
    
    func searchTweet() {
        swifter.searchTweet(using: "@apple", lang: "en", count: 100) { (results, metadata) in
            print(results)
        } failure: { (error) in
            print("There was an errror with the twitter API request \(error)")
        }

    }
}

