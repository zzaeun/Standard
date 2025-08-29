//
//  ViewController.swift
//  1.2
//
//  Created by 이정은 on 8/29/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!

    let counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "0"
    }
    @IBAction func excuteCounter(_ sender: UIButton) {
        let newCount = counter.addCount()
        countLabel.text = "\(newCount)"
    }
    

}

