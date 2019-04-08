//
//  CryptoViewController.swift
//  Introduction to Native iOS Development
//
//  Created by Sandro Machado on 08/04/2019.
//  Copyright © 2019 Sandro Machado. All rights reserved.
//

import UIKit
import Alamofire

class CryptoViewController: UIViewController {

    @IBOutlet weak var amount: UITextField!
    
    @IBOutlet weak var originCurrency: UITextField!
    
    @IBOutlet weak var destinationCurrency: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Crypto Converter"
    }

    @IBAction func ditTapButton(_ sender: Any) {
        activityIndicator.startAnimating()
        
        AF.request("https://api.uphold.com/v0/ticker/\(self.originCurrency.text!)\(self.destinationCurrency.text!)").responseJSON { response in
            
            self.activityIndicator.stopAnimating()

            switch response.result {
                
                case .success:
                    if let json = response.result.value as? [String: Any], let amountValue = self.amount.text {
                        guard let ask = json["ask"] as? String else {
                            print("Failed to parse JSON")

                            return
                        }
                    
                        self.result.text = "\(Double(amountValue)! * Double(ask)!)"
                    }
                
                case .failure(let error):
                    print(error)
            }
        }
    }
}
