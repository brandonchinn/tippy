//
//  SettingsViewController.swift
//  tippy
//
//  Created by Brandon Chinn on 9/23/16.
//  Copyright © 2016 Brandon Chinn. All rights reserved.
//

import UIKit

let TIP_SETTING_DEFAULT_KEY = "TipSettingDefault"
let TIP_SETTING_EXCELLENT_VALUE_KEY = "TipSettingExcellentValue"
let TIP_SETTING_GOOD_VALUE_KEY = "TipSettingGoodValue"
let TIP_SETTING_OKAY_VALUE_KEY = "TipSettingOkayValue"

enum TipPercentType: Int {
    case Okay = 0
    case Good = 1
    case Excellent = 2
}

class SettingsViewController: UIViewController {
    


    @IBOutlet weak var excellentTipValueLabel: UILabel!
    @IBOutlet weak var goodTipValueLabel: UILabel!
    @IBOutlet weak var okayTipValueLabel: UILabel!
    @IBOutlet weak var defaultTipSegmentedControl: UISegmentedControl!
    
    var excellentTipValue = 20
    var goodTipValue = 18
    var okayTipValue = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white], for: .selected)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadSettings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveSettings()
    }
    
    func loadSettings() {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: TIP_SETTING_DEFAULT_KEY)
        defaultTipSegmentedControl.selectedSegmentIndex = defaultTipIndex
        
        excellentTipValue = defaults.object(forKey: TIP_SETTING_EXCELLENT_VALUE_KEY) as! Int? ?? excellentTipValue
        updateLabel(label: excellentTipValueLabel, value: excellentTipValue)
        goodTipValue = defaults.object(forKey: TIP_SETTING_GOOD_VALUE_KEY) as! Int? ?? goodTipValue
        updateLabel(label: goodTipValueLabel, value: goodTipValue)
        okayTipValue = defaults.object(forKey: TIP_SETTING_OKAY_VALUE_KEY) as! Int? ?? okayTipValue
        updateLabel(label: okayTipValueLabel, value: okayTipValue)
    }
    
    func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipSegmentedControl.selectedSegmentIndex, forKey: TIP_SETTING_DEFAULT_KEY)
        defaults.set(excellentTipValue, forKey: TIP_SETTING_EXCELLENT_VALUE_KEY)
        defaults.set(goodTipValue, forKey: TIP_SETTING_GOOD_VALUE_KEY)
        defaults.set(okayTipValue, forKey: TIP_SETTING_OKAY_VALUE_KEY)
        defaults.synchronize()
    }
    
    /*
     * TODO: make this into a custom control
     */
    @IBAction func onPlusButtonClick(_ sender: UIButton) {
        adjustTipValue(tag: sender.tag, offset: 1)
    }
    
    @IBAction func onMinusButtonClick(_ sender: AnyObject) {
        adjustTipValue(tag: sender.tag, offset: -1)
    }
    
    func adjustTipValue(tag: Int, offset: Int) {
        switch tag {
        case TipPercentType.Excellent.rawValue:
            excellentTipValue += offset
            // must be >= goodTipValue
            excellentTipValue = max(excellentTipValue, goodTipValue)
            updateLabel(label: excellentTipValueLabel, value: excellentTipValue)
        case TipPercentType.Good.rawValue:
            goodTipValue += offset
            // must be <= excellentTipValue and >= okayTipValue
            goodTipValue = max(goodTipValue, okayTipValue)
            goodTipValue = min(goodTipValue, excellentTipValue)
            updateLabel(label: goodTipValueLabel, value: goodTipValue)
        case TipPercentType.Okay.rawValue:
            okayTipValue += offset
            // must be <= goodTipValue
            okayTipValue = min(okayTipValue, goodTipValue)
            updateLabel(label: okayTipValueLabel, value: okayTipValue)
        default:
            break
        }
    }
    
    func updateLabel(label: UILabel, value: Int) {
        label.text = String(format: "%d%%", value)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
