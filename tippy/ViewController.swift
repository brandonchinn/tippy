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
    
    var tipPercentages: [Int: Int] = [TipPercentType.Okay.rawValue: 15, TipPercentType.Good.rawValue: 18, TipPercentType.Excellent.rawValue: 20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white], for: .selected)
        
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadSettings()
        calculateTip(billValue: (Double(billField.text!) ?? 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSettings() {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: TIP_SETTING_DEFAULT_KEY)
        tipSegmentedControl.selectedSegmentIndex = defaultTipIndex
        tipPercentages[TipPercentType.Excellent.rawValue] = defaults.object(forKey: TIP_SETTING_EXCELLENT_VALUE_KEY) as! Int? ?? tipPercentages[TipPercentType.Excellent.rawValue]
        tipPercentages[TipPercentType.Good.rawValue] = defaults.object(forKey: TIP_SETTING_GOOD_VALUE_KEY) as! Int? ?? tipPercentages[TipPercentType.Good.rawValue]
        tipPercentages[TipPercentType.Okay.rawValue] = defaults.object(forKey: TIP_SETTING_OKAY_VALUE_KEY) as! Int? ?? tipPercentages[TipPercentType.Okay.rawValue]
        
    }
    
    func calculateTip(billValue: Double) {
        let tipPercent = Double(tipPercentages[tipSegmentedControl.selectedSegmentIndex]!) / 100.0
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

