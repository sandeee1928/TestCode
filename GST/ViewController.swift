//
//  ViewController.swift
//  GST
//
//  Created by Rubiya on 12/08/17.
//  Copyright © 2017 Rubiya. All rights reserved.
//

import UIKit

enum TaxRate: Float {
    
    case zero = 0.0
    case pointTwoFive = 0.25
    case three = 3.0
    case five  = 5.0
    case eighteen = 18.0
    case twentyEight = 28.0
    
    func increment() -> TaxRate {
        switch self {
        case .zero:
            return .pointTwoFive
        case .pointTwoFive:
            return .three
        case .three:
            return .five
        case .five:
            return .eighteen
        case .eighteen:
            return .twentyEight
        case .twentyEight:
            return .zero
        }
    }
    
    func decrement() -> TaxRate {
        switch self {
        case .zero:
            return .twentyEight
        case .pointTwoFive:
            return .zero
        case .three:
            return .pointTwoFive
        case .five:
            return .three
        case .eighteen:
            return .five
        case .twentyEight:
            return .eighteen
        }
    }
}

struct Constants {
    static let aNavigationTitle = "GST Calculator India"
    static let aRuppesSymbole = "\u{20B9}"
    static let aAmountCellIdentifier = "AmoutCellIdentifier"
    static let aGstRateCellIdentifier = "GSTRateCellIdentifier"
    static let aGoodsPriceCellIdentifier = "GoodsPriceCellIdentifier"
    static let aGstTaxPriceCellIdentifier = "GSTTAxCellIdentifier"
    static let aTotalBillCellIdentifier = "TotalBillCellIdentifier"
    static let aDefaultCellIdentifier = "TotalBillCellIdentifier"
    static let aDefaultAmountValue = 1000.0
    static let aDefaultTaxRate = 28.0
}

class ViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableV: UITableView!
    var amountValue :Float? = 1000.0
    var textFiledValue : String = ""
    var taxRate = TaxRate.twentyEight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().isTranslucent = false
        self.title = Constants.aNavigationTitle
        self.tableV.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier:Constants.aAmountCellIdentifier, for: indexPath) as? AmountTableViewCell
            cell?.amountLabel?.text = "\(Constants.aRuppesSymbole)  \(String(describing: amountValue!))"
            return cell!
       
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier:Constants.aGstRateCellIdentifier, for: indexPath) as? GstRateTableViewCell
            
            cell?.gstRateLabel?.text = "\("GSTRate") \(String(describing: taxRate))\("%")"
            return cell!
       
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier:Constants.aGoodsPriceCellIdentifier, for: indexPath) as? GoodsPriceTableViewCell
            
            print(amountValue!)
            cell?.goodPriceLabe?.text = "\(Constants.aRuppesSymbole)  \(String(describing: amountValue!))"
            return cell!

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.aGstTaxPriceCellIdentifier, for: indexPath) as? GstTAxTableViewCell
            
            print("")
            cell?.gstTaxLabe?.text = "\(Constants.aRuppesSymbole) \(self.calculateTheTax(aTax: taxRate.rawValue, amountValue: amountValue!, isTotalValue: false))"
            return cell!

        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.aTotalBillCellIdentifier, for: indexPath) as? TotalBillTableViewCell
            // Total Bill
            cell?.totalBillLabel?.text = "\(Constants.aRuppesSymbole) \(self.calculateTheTax(aTax: taxRate.rawValue, amountValue: amountValue!, isTotalValue: true))"
            return cell!
    
        default:
           let cell = tableView.dequeueReusableCell(withIdentifier:Constants.aDefaultCellIdentifier, for: indexPath)
            return cell

        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch indexPath.row {
        case 0,1:
            return 80
        
        case 2,3,4:
            return 60
            
        default:
            return 44.0
        }
        
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        switch indexPath.row {
        case 0,1:
            return 80
            
        case 2,3,4:
            return 60
            
        default:
            return 44.0
        }
    }

  // Mark : UITextField delegate method
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let textValue = textField.text {
           let aTextValue = "\(textValue)\(string)"
            amountValue = Float (aTextValue)
            let myIndexPath = IndexPath(row: 3, section: 0)
            let myIndexPath1 = IndexPath(row: 4, section: 0)
            tableV.reloadRows(at: [myIndexPath,myIndexPath1], with: .automatic)
        }
            return true
    }
    
    @IBAction func increaseAndDecreaseTheRate(_ sender: UIButton) {
        taxRate = (sender.tag == 2) ? taxRate.increment() : taxRate.decrement()
        self.tableV.reloadData()
}
    
    // Get the TaxRate function 
    
    public func calculateTheTax(aTax: Float, amountValue: Float,isTotalValue:Bool) -> Float{
        let value = isTotalValue ? (amountValue/100)*aTax + amountValue :(amountValue/100)*aTax
        return  value
    }

}

