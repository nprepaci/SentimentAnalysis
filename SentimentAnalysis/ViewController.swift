//
//  ViewController.swift
//  SentimentAnalysis
//
//  Created by Nicholas Repaci on 10/28/20.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var sentimentLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let sentimentClassifier = try! TweetSentimentClassifier(configuration: MLModelConfiguration.init())
    
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
        var tweets = [String]()
        
        swifter.searchTweet(using: "@apple", lang: "en", count: 100, tweetMode: .extended) { (results, metadata) in
            //print(results)
            for i in 0..<100 {
                //in this case full text is a type
                if let tweet = results[i]["full text"].string {
                    tweets.append(tweet)
                }
            }
            
            
            
            
        } failure: { (error) in
            print("There was an errror with the twitter API request \(error)")
        }

    }
    
    func predict() {
        let prediction = try! sentimentClassifier.prediction(text: "@apple  is a bad company")
        
        print(prediction.label)
    }
}

