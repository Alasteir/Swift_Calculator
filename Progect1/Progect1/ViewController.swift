

import UIKit

class ViewController: UIViewController {
    
    var resultDouble1 : String = "";
    
    var resultDouble2 :String = "";
    
    var oparation : String = "";
    
    var after_equally : Double = 0;
    
    var equelly:Bool = false;
    
    @IBOutlet weak var histori: UITextView!
    
    
    func appendTextToTextView(_ text: String) {
        // Добавляем новый текст с переводом строки, если UITextView не пуст
        let newText = histori.text.isEmpty ? text : "\n" + text
        
        // Добавляем новый текст
        histori.text += newText
        
        // Вызываем метод для автоматического смещения новых строк внизу
        moveTextDown()
    }

    func moveTextDown() {
        let size = histori.sizeThatFits(CGSize(width: histori.frame.width, height: CGFloat.greatestFiniteMagnitude))
           
           // Устанавливаем новый контент оффсет, чтобы прокрутить вниз
           histori.setContentOffset(CGPoint(x: 0, y: size.height - histori.bounds.height), animated: false)
    }
    
    
    
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
                if result.text != "0" && result.text != "" {
                    
                if resultDouble2 != "" &&  equelly == false && oparation != ""{
                    
                    resultDouble2.removeLast()
                    result.text?.removeLast()
                    
                    }
                
                else if  resultDouble1 != "" && oparation != "" {
                    
                    oparation = ""
                    result.text?.removeLast()
                   
                }
                else if  resultDouble1 != "" && oparation == "" && resultDouble2 == "" {
                    
                    
                    resultDouble1.removeLast()
                    result.text?.removeLast()
                    
                    if resultDouble1 == "" {
                        result.text = "0"
                    }
                    
                }
                
                   
                    
                }
                
                
                
            case 13:
                if oparation == "" && result.text != "0" && result.text != "" && equelly == false {
                    if Double( resultDouble1)! > 0 {
                        resultDouble1.insert("-", at: resultDouble1.startIndex)
                        result.text = resultDouble1;
                    }
                    else if Double( resultDouble1)! < 0 {
                        resultDouble1 = resultDouble1.replacingOccurrences(of: "-", with: "")
                        result.text = resultDouble1
                    }
                }
                else if oparation != "" && resultDouble2 != "0" && resultDouble2 != ""{
                    if Double( resultDouble2)! > 0 && oparation != ""   {
                        resultDouble2.insert("-", at: resultDouble2.startIndex)
                        result.text = resultDouble1 + oparation + resultDouble2;
                    }
                    else if Double( resultDouble2)! < 0 && oparation != "" {
                        
                        resultDouble2 = resultDouble2.replacingOccurrences(of: "-", with: "")
                        result.text = resultDouble1 + oparation +  resultDouble2
                    }
                    
                }
                
                
            case 14:
                if result.text != "0" && result.text != "0." && resultDouble2 != "-"  && equelly == false && resultDouble2 == ""{
                   
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
                    case "": after_equally = (value1 * value2) / 100;
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
                    
                    
                    
                    result.text = "0";
                    resultDouble1 = "";
                    resultDouble2 = "";
                    oparation = "";
                    equelly = false;
                    
                
                    
                }
                
                    
                else if  equelly == true && after_equally != 0 {
                    result.text = String( after_equally / 100)
                    
                }
                
                
            case 15:
                if resultDouble1 != "" &&  resultDouble2 == "" &&  equelly == false && oparation == ""{
                    oparation = "÷";
                    
                    result.text = result.text! + "÷";
                    
                }
                
            case 16:
                if resultDouble1 != "" &&  resultDouble2 == "" && equelly == false && oparation == ""{
                   oparation = "x";
                    
                result.text = result.text! + "x";
                }
                
            case 17:
                    if resultDouble1 != "" &&  resultDouble2 == "" &&  equelly == false && oparation == ""{
                oparation = "-";
                        
                result.text = result.text! + "-";
                    }
            
            case 18:
                if resultDouble1 != "" &&  resultDouble2 == "" && equelly == false && oparation == ""{
                oparation = "+";
                    
                result.text = result.text! + "+";
                }
                
            case 19: if oparation != "" && resultDouble2 != "" && resultDouble2 != "-" && equelly == false{
                let value1 = Double(resultDouble1) ?? 0;
                let value2 = Double(resultDouble2) ?? 0;
                
                switch oparation  {
                case "+": after_equally = value1 + value2;
                case "-": after_equally = value1 - value2;
                case "x": after_equally = value1 * value2;
                case "÷": after_equally = value1 / value2;
                
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
                    equelly = true
                }
                
                
                if  result.text != "0" && resultDouble2 != ""  {
                    
                    appendTextToTextView(result.text!)
                    
                }
                 
                

                
                result.text = "0";
                resultDouble1 = "";
                resultDouble2 = "";
                oparation = "";
                equelly = false;
                
            }
                
           default: break
                
            }
            
        }
    }
    
    

}


