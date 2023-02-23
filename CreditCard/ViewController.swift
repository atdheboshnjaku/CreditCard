//
//  ViewController.swift
//  CreditCard
//
//  Created by Atdhe Boshnjaku on 2/17/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var creditCardNumber: UILabel!
    @IBOutlet weak var CreditCardNumberTextField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CreditCardNumberTextField.delegate = self
        
        CreditCardNumberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        cardView.layer.cornerRadius = 10
        
        CreditCardNumberTextField.attributedPlaceholder = NSAttributedString(string:"Enter Credit Card Number", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black])

        creditCardNumber.adjustsFontSizeToFitWidth = true
        creditCardNumber.minimumScaleFactor = 0.5
        
    }
    
    
    
    var maxLen : Int = 16
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

         if(textField == CreditCardNumberTextField){
            let currentText = textField.text! + string
            return currentText.count <= maxLen
         }

         return true;
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        
        creditCardNumber.text = CreditCardNumberTextField.text?.separate(every: 4, with: "   ")
        
    }

}

extension String {

    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
}
