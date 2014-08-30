//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ray Ho on 8/29/14.
//  Copyright (c) 2014 Ray Ho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var tipSegment: UISegmentedControl!
    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Util.initTipSegment(tipSegment)
        Util.selectDefaultTipSegment(tipSegment)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        Util.setDefaultTipSegment(tipSegment.selectedSegmentIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}