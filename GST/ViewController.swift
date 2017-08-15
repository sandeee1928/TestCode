//
//  ViewController.swift
//  GST
//
//  Created by Rubiya on 12/08/17.
//  Copyright © 2017 Rubiya. All rights reserved.
//

import UIKit

enum TaxRate: Float {
    
    case Zero = 0.0
    case pointTwoFive = 0.25
    case three = 3.0
    case five  = 5.0
    case eighteen = 18.0
    case twentyEight = 28.0
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
    var taxRate : Float? = 28.0
    
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
            
            cell?.gstRateLabel?.text = "\("GSTRate") \(String(describing: taxRate!))\("%")"
            return cell!
       
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier:Constants.aGoodsPriceCellIdentifier, for: indexPath) as? GoodsPriceTableViewCell
            
            print(amountValue!)
            cell?.goodPriceLabe?.text = "\(Constants.aRuppesSymbole)  \(String(describing: amountValue!))"
            return cell!

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.aGstTaxPriceCellIdentifier, for: indexPath) as? GstTAxTableViewCell
            
            print("")
            cell?.gstTaxLabe?.text = "\(Constants.aRuppesSymbole) \(self.calculateTheTax(aTax: taxRate!, amountValue: amountValue!, isTotalValue: false))"
            return cell!

        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.aTotalBillCellIdentifier, for: indexPath) as? TotalBillTableViewCell
            // Total Bill
            cell?.totalBillLabel?.text = "\(Constants.aRuppesSymbole) \(self.calculateTheTax(aTax: taxRate!, amountValue: amountValue!, isTotalValue: true))"
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
    
    @IBAction func increaseAndDecreaseTheRate(_ sender: Any) {
        
        let aValue : Float = taxRate!
        let enumValue = TaxRate.self
        
        if (sender as AnyObject).tag == 2 {
            switch aValue {
                case enumValue.Zero.rawValue:
                taxRate = TaxRate.Zero.rawValue
                break
           
            case enumValue.pointTwoFive.rawValue:
                taxRate = TaxRate.Zero.rawValue
                break

            case enumValue.three.rawValue:
                taxRate = TaxRate.pointTwoFive.rawValue
                break

            case enumValue.five.rawValue:
                taxRate = TaxRate.three.rawValue
                break
                
            case enumValue.eighteen.rawValue:
                taxRate = TaxRate.five.rawValue
                break
                
            case enumValue.twentyEight.rawValue:
                taxRate = TaxRate.eighteen.rawValue
                break

            default:
                break
                
            }
            
        }else{
            
            switch aValue {
                
            case enumValue.Zero.rawValue:
                taxRate = TaxRate.pointTwoFive.rawValue
                break
                
            case enumValue.pointTwoFive.rawValue:
                taxRate = TaxRate.three.rawValue
                break
                
            case enumValue.three.rawValue:
                taxRate = TaxRate.five.rawValue
                break
                
            case enumValue.five.rawValue:
                taxRate = TaxRate.eighteen.rawValue
                break
                
            case enumValue.eighteen.rawValue:
                taxRate = TaxRate.twentyEight.rawValue
                break
                
            case enumValue.twentyEight.rawValue:
                taxRate = TaxRate.twentyEight.rawValue
                break
                
            default:
                break

            
        }
    }
        
        self.tableV.reloadData()
}
    
    // Get the TaxRate function 
    
    public func calculateTheTax(aTax: Float, amountValue: Float,isTotalValue:Bool) -> Float{
        
        let value = isTotalValue ? (amountValue/100)*aTax + amountValue :(amountValue/100)*aTax
        return  value
    }

}

