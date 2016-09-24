//
//  ViewController.swift
//  tippy
//
//  Created by Brandon Chinn on 9/22/16.
//  Copyright © 2016 Brandon Chinn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white], for: .selected)
        
        calculateTip(billValue: (Double(billField.text!) ?? 0))
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTip(billValue: Double) {
        let tipPercentages = [0.15, 0.18, 0.2]
        let tipPercent = tipPercentages[tipSegmentedControl.selectedSegmentIndex]
        let tipValue = billValue * tipPercent
        let total = billValue + tipValue
        tipLabel.text = String(format: "Tip (%d%%):", Int(tipPercent * 100))
        tipValueLabel.text = String(format: "$%.2f", tipValue)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onBillValueChanged(_ sender: AnyObject) {
        calculateTip(billValue: (Double(billField.text!) ?? 0))
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

