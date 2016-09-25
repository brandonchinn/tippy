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
    @IBOutlet weak var roundSwitch: UISwitch!
    
    var tipPercentages: [Int: Int] = [TipPercentType.Okay.rawValue: 15, TipPercentType.Good.rawValue: 18, TipPercentType.Excellent.rawValue: 20]
    
    var roundingMethod = Int()
    
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
        // 0 is default which is what is returned when not found
        let defaultTipIndex = defaults.integer(forKey: TIP_SETTING_DEFAULT_KEY)
        tipSegmentedControl.selectedSegmentIndex = defaultTipIndex
        tipPercentages[TipPercentType.Excellent.rawValue] = defaults.object(forKey: TIP_SETTING_EXCELLENT_VALUE_KEY) as! Int? ?? tipPercentages[TipPercentType.Excellent.rawValue]
        tipPercentages[TipPercentType.Good.rawValue] = defaults.object(forKey: TIP_SETTING_GOOD_VALUE_KEY) as! Int? ?? tipPercentages[TipPercentType.Good.rawValue]
        tipPercentages[TipPercentType.Okay.rawValue] = defaults.object(forKey: TIP_SETTING_OKAY_VALUE_KEY) as! Int? ?? tipPercentages[TipPercentType.Okay.rawValue]
        
        // 0 is default which is what is returned when not found
        roundingMethod = defaults.integer(forKey: TIP_SETTING_ROUNDING_METHOD_KEY)
    }
    
    func calculateTip(billValue: Double) {
        let tipPercent = Double(tipPercentages[tipSegmentedControl.selectedSegmentIndex]!) / 100.0
        var tipValue = billValue * tipPercent
        var total = billValue + tipValue
        
        if (roundSwitch.isOn) {
            total = roundWithRoundingMethod(roundingMethod, value: total)
            tipValue = total - billValue
            let roundTipPercent = tipValue / billValue
            tipLabel.text = String(format: "Tip (%0.1f%%):", roundTipPercent * 100)
        } else {
            tipLabel.text = String(format: "Tip (%d%%):", Int(tipPercent * 100))
        }
        
        tipValueLabel.text = String(format: "$%.2f", tipValue)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func roundWithRoundingMethod(_ method: Int, value: Double) -> Double {
        switch roundingMethod {
        case RoundingMethod.Nearest.rawValue:
            return round(value)
        case RoundingMethod.Down.rawValue:
            return floor(value)
        case RoundingMethod.Up.rawValue:
            return ceil(value)
        default:
            return value
        }
    }
    
    @IBAction func onBillValueChanged(_ sender: AnyObject) {
        calculateTip(billValue: (Double(billField.text!) ?? 0))
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

