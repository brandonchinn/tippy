//
//  SettingsViewController.swift
//  tippy
//
//  Created by Brandon Chinn on 9/23/16.
//  Copyright © 2016 Brandon Chinn. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white], for: .selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
