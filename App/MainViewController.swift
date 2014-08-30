//
//  MainViewController.swift
//  TipCalculator
//
//  Created by Ray Ho on 8/26/14.
//  Copyright (c) 2014 Ray Ho. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var calc: Calculator = Calculator()
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipSegment: UISegmentedControl!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBAction func onBillFieldChanged(sender: UITextField) {
        updateUI()
    }
    @IBAction func onTipSegmentChanged(sender: UISegmentedControl) {
        updateUI()
    }
    @IBAction func onTapAnywhere(sender: UITapGestureRecognizer) {
        billField.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize tip chooser
        Util.initTipSegment(tipSegment)
        Util.selectDefaultTipSegment(tipSegment)

        // Allow keyboard to immediately focus on bill field
        billField.becomeFirstResponder()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func updateUI() {
        // Update calculator
        calc.subtotal = Util.parseDecimal(billField.text)
        calc.percentage = Util.getTipSegmentPercentage(tipSegment.selectedSegmentIndex)

        // Update tip amount
        tipLabel.text = Util.formatCurrency(calc.tip)

        // Update total
        totalLabel.text = Util.formatCurrency(calc.total)
    }
}
