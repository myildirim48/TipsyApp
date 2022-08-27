//
//  ResultViewController.swift
//  TipsyApp
//
//  Created by YILDIRIM on 28.08.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = result
        billLabel.text = "Split between \(split) people, with \(tip)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
