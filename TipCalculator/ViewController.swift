//
//  ViewController.swift
//  TipCalculator
//
//  Created by _m on 10/6/14.
//  Copyright (c) 2014 altolabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Constants!
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    // Expose these to the view
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions!
    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        
        for (tipPct, tipValue) in possibleTips {
            let formattedTipValue = String(format: "%0.2f", tipValue)
            results += "\(tipPct)%:  $\(formattedTipValue)\n"
        }
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    // Utility functions
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
}

