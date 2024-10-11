//
//  ViewController.swift
//  Multiply Final App
//
//  Created by Miles Belknap on 3/31/21.
//  Copyright © 2021 Miles Belknap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var num1TextField: UITextField!
    
    @IBOutlet weak var num2TextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var marioKartImage: UIImageView!
    
    @IBOutlet weak var operationLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.selectedSegmentIndex = 2
        operationLabel.text = "*"

    }

    
    @IBAction func onMultiplyButtonTapped(_ sender: UIButton)
    {
        //Hide the keyboard
        num2TextField.resignFirstResponder()
        num1TextField.resignFirstResponder()
        
        //Multiply num1TF * num2TF number
        let number1 = Int(num1TextField.text!)
        let number2 = Int(num2TextField.text!)
        //let product = number1! * number2!
        var product = 0
        //do the operation depending on the segmentedcontrol's selected index
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
             product = number1! + number2!
        case 1:
             product = number1! - number2!
        case 2:
             product = number1! * number2!
        case 3:
             product = number1! / number2!
        case 4:
             product = number1! % number2!
        default:
            answerLabel.text = "error: operation couldn't complete"
        }
        
        //display that snwer in the answerlabel
        answerLabel.text = String(product)
        
        //if product is equal to 64, show linkImage in imageview
        if (product == 64){
            marioKartImage.image = UIImage(named: "linkImage")
        }
        else if (product % 2 == 0)
        {
            marioKartImage.image = UIImage(named: "yoshiImage")
        }
        else
        {
            marioKartImage.image = UIImage(named: "peachImage")
        }
    }
    

    @IBAction func onClearButtonTapped(_ sender: UIButton)
    {
        //erase the text in the textfields
        num1TextField.text = ""
        num2TextField.text = ""
        //set answerlabel to Product / Answer
        answerLabel.text = "Product / Answer"
        // remove the image displayed
        marioKartImage.image = UIImage(named: "")
        segmentedControl.selectedSegmentIndex = 2
        operationLabel.text = "*"
    }
    
    
    @IBAction func onOperationSegmentTapped(_ sender: UISegmentedControl)
    {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            operationLabel.text = "+"
        case 1:
            operationLabel.text = "-"
        case 2:
            operationLabel.text = "*"
        case 3:
            operationLabel.text = "/"
        case 4:
            operationLabel.text = "%"
        default:
            operationLabel.text = "error: no operation"
        }
    }
    
    
    @IBAction func onSliderOneMoved(_ sender: UISlider)
    {
        //when slider moves, change value in num1TextField
        let senderIntegerValue = Int(sender.value)
        num1TextField.text = String(senderIntegerValue)
    }
    
    
    @IBAction func onSliderTwoMoved(_ sender: UISlider)
    {
        //when slider moves, change value in num2TextField
        let senderIntegerValue = Int(sender.value)
        num2TextField.text = String(senderIntegerValue)
    }
}

