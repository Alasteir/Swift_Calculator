

import UIKit

class ViewController: UIViewController {
    
    var resultDouble1 : String = "";
    
    var resultDouble2 :String = "";
    
    var oparation : String = "";
    
    var after_equally : Double = 0;
    
    var equelly:Bool = false;
    
    //1
    @IBOutlet weak var result: UITextField!
    
    
    @IBAction func digits(_ sender: UIButton) {
        if result.text == "0" && equelly == false {
            result.text = "";
            result.text = result.text! + String(sender.tag)
        }
        else if  equelly == false {
            result.text = result.text! + String(sender.tag)
        }
        
        if oparation == "" {
            resultDouble1 += String(sender.tag);
        }
        else if oparation != "" {
            resultDouble2 += String(sender.tag);
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func simbolResult(_ sender: UIButton) {
        if result.text != "" {
            
            switch sender.tag {
                
            case 11:
                if equelly == false && oparation == "" && resultDouble2 == ""{
                
                 resultDouble1 = resultDouble1 + ".";
                    result.text = result.text! + "."
            }
            else if equelly == false && oparation != "" && resultDouble2 != "" {
                     resultDouble2 = resultDouble2 +  ".";
                result.text = result.text! + "."
            }
                
            
            
                
                
                
            case 12:
                result.text = "0";
                resultDouble1 = "";
                resultDouble2 = "";
                oparation = "";
                equelly = false;
                
            case 13:
                if oparation == "" && result.text != "0" {
                    if Double( resultDouble1)! > 0 {
                        resultDouble1.insert("-", at: resultDouble1.startIndex)
                        result.text = resultDouble1;
                    }
                    else if Double( resultDouble1)! < 0 {
                        resultDouble1 = resultDouble1.replacingOccurrences(of: "-", with: "")
                        result.text = resultDouble1
                    }
                }
                else if oparation != "" && resultDouble2 != "0"{
                    if Double( resultDouble2)! > 0 && oparation != "" && equelly == false {
                        resultDouble2.insert("-", at: resultDouble2.startIndex)
                        result.text = resultDouble1 + oparation + resultDouble2;
                    }
                    else if Double( resultDouble2)! < 0 && oparation != "" && equelly == false{
                        resultDouble1 = resultDouble2.replacingOccurrences(of: "-", with: "")
                        result.text = resultDouble1 + oparation +  resultDouble2
                    }
                    
                }
                
                
            case 14:
                if result.text != "0" && result.text != "0."   && equelly == false && resultDouble2 == ""{
                   
                   let value14 = Double(resultDouble1) ?? 0;
                    let valueToResult = String(value14 / 100)
                   result.text = valueToResult;
                   resultDouble1 = valueToResult;
               }
                
                else if equelly == false && oparation != ""  && resultDouble2 != ""{
                    let value1 = Double(resultDouble1) ?? 0;
                    let value2 = Double(resultDouble2) ?? 0;
                    
                    switch oparation  {
                    case "+": after_equally = (value1 + value2) / 100;
                    case "-": after_equally = (value1 - value2) / 100;
                    case "*": after_equally = (value1 * value2) / 100;
                    case "/": after_equally = (value1 / value2) / 100;
                    
                    default: break
                    }
                    let formatted_equelly = String(format: "%.3f", after_equally)
                    
                    if after_equally.truncatingRemainder(dividingBy: 1) == 0{
                        
                        result.text = result.text! + " = " + String( Int(after_equally))
                        equelly = true;
                    }
                    else if formatted_equelly.hasSuffix("0") {
                        var trimmedFormattedEquelly = formatted_equelly

                        while trimmedFormattedEquelly.hasSuffix("0") {
                            trimmedFormattedEquelly = String(trimmedFormattedEquelly.dropLast())
                        }

                        result.text = result.text! + " = " + trimmedFormattedEquelly
                        equelly = true
                    }
                    else {
                       
                        result.text = result.text! + " = " + formatted_equelly
                        equelly = true
                    }
                    

                    
                    resultDouble1 = "";
                    resultDouble2 = "";
                    oparation = "";
                
                    
                }
                
                    
                else if  equelly == true && after_equally != 0 {
                    result.text = String( after_equally / 100)
                    
                }
                
            case 15:
                if equelly == false{
                    oparation = "/";
                    result.text = result.text! + " ÷ ";
                    
                }
                
            case 16:
                if equelly == false{
                    
                oparation = "*";
                result.text = result.text! + " x ";
                }
                
            case 17:
                    if equelly == false{
                oparation = "-";
                result.text = result.text! + " - ";
                    }
            
            case 18:
                if equelly == false{
                oparation = "+";
                result.text = result.text! + " + ";
                }
                
            case 19: if oparation != "" && resultDouble2 != "" && equelly == false{
                let value1 = Double(resultDouble1) ?? 0;
                let value2 = Double(resultDouble2) ?? 0;
                
                switch oparation  {
                case "+": after_equally = value1 + value2;
                case "-": after_equally = value1 - value2;
                case "*": after_equally = value1 * value2;
                case "/": after_equally = value1 / value2;
                
                default: break
                }
                
                let formatted_equelly = String(format: "%.3f", after_equally)
                
                if after_equally.truncatingRemainder(dividingBy: 1) == 0{
                    
                    result.text = result.text! + " = " + String( Int(after_equally))
                    equelly = true;
                }
                else if formatted_equelly.hasSuffix("0") {
                    var trimmedFormattedEquelly = formatted_equelly

                    while trimmedFormattedEquelly.hasSuffix("0") {
                        trimmedFormattedEquelly = String(trimmedFormattedEquelly.dropLast())
                    }

                    result.text = result.text! + " = " + trimmedFormattedEquelly
                    equelly = true
                }
                else {
                    result.text = result.text! + " = " +  formatted_equelly
                }
                 
                

                
                resultDouble1 = "";
                resultDouble2 = "";
                oparation = "";
            }
                
           default: break
                
            }
            
        }
    }
    
    

}


