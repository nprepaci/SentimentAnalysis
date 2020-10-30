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
    
    let swifter = Swifter(consumerKey: "0ykYiKosHWAoWr0zoTOgcCKlW", consumerSecret: "f2RLufwaVdaPgUmqAZNcqlm5eYPiNwuECqvNfhfHb6YYrLCNL7")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        
    }
}

