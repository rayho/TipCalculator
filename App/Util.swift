//
//  Util.swift
//  TipCalculator
//
//  Created by Ray Ho on 8/29/14.
//  Copyright (c) 2014 Ray Ho. All rights reserved.
//

import UIKit

var TIPCALC_LOCALE: NSLocale = NSLocale.autoupdatingCurrentLocale()
let TIPCALC_PERCENTAGES: Array<Double> = [ 15, 18, 20 ]
let TIPCALC_KEY_TIP_SEGMENT: String = "tip_segment"

class Util {
    /** Parses a string to a double, observing the device's current locale; zero if unable to parse. */
    class func parseDecimal(amountString: String) -> Double {
        var formatter: NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.locale = TIPCALC_LOCALE
        var parsed = formatter.numberFromString(amountString)
        return parsed != nil ? parsed!.doubleValue : 0
    }

    /** Formats a double to the local currency. */
    class func formatCurrency(amount: Double) -> String {
        var formatter: NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = TIPCALC_LOCALE
        return formatter.stringFromNumber(amount)
    }

    /** Populates tip chooser. */
    class func initTipSegment(tipSegment: UISegmentedControl) {
        // Populate segments
        tipSegment.removeAllSegments()
        for percentage in TIPCALC_PERCENTAGES {
            tipSegment.insertSegmentWithTitle(String(format: "%0.0f%%", percentage), atIndex: tipSegment.numberOfSegments, animated: false)
        }
    }

    /** Updates tip chooser to select the default tip percentage. */
    class func selectDefaultTipSegment(tipSegment: UISegmentedControl) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let defaultIndex: Int = defaults.integerForKey(TIPCALC_KEY_TIP_SEGMENT)
        tipSegment.selectedSegmentIndex = defaultIndex
    }

    /** Updates the default tip chooser selection index. */
    class func setDefaultTipSegment(index: Int) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(index, forKey: TIPCALC_KEY_TIP_SEGMENT)
        defaults.synchronize()
    }

    /** Retrieves the tip percentage mapped to a particular tip chooser selection index. */
    class func getTipSegmentPercentage(index: Int) -> Double {
        return TIPCALC_PERCENTAGES[index]
    }

}