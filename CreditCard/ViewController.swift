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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CreditCardNumberTextField.delegate = self
        
        CreditCardNumberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        backgroundImage.layer.cornerRadius = 10
        
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



//extension String {
//
//    func separate(every stride: Int, with separator: Character) -> String {
//        return String(self.enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1] }.joined())
//    }
//
//}

extension String {

    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
}
