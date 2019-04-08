//
//  MainViewController.swift
//  Introduction to Native iOS Development
//
//  Created by Sandro Machado on 08/04/2019.
//  Copyright © 2019 Sandro Machado. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        self.navigationController?.pushViewController(CryptoViewController(nibName: "CryptoViewController", bundle: nil), animated: true)
    }
}
