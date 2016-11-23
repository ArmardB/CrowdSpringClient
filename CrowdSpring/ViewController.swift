//
//  ViewController.swift
//  CrowdSpring
//
//  Created by Armard Bellamy on 10/5/16.
//  Copyright © 2016 Armard Bellamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBAction func sendButtonTapped(_ sender:
        AnyObject) {
        let userKeyWord = keywordTextField.text
        
        if isStringEmpty(stringValue: userKeyWord!) == true {
            return
        }
        
//        let scriptUrl = "https://crowdspring.herokuapp.com/"
        
        // Set base URL for API call
        let scriptUrl = "http://localhost:8080/svc/v1/tweets/"
        
        //Apend URL to receive keyword
        let urlWithParams = scriptUrl + "%23" + userKeyWord!
    
        // cast as URL object
        let myUrl = NSURL(string: urlWithParams);
        
        let request = NSMutableURLRequest(url: myUrl as! URL)
        
        
        request.httpMethod = "GET"
    
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print ("responseString = \(responseString)")
            
            do {
               if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    print(convertedJsonIntoDict)
                    
                    let keyWordValue = convertedJsonIntoDict["keyword"] as? String
                    print(keyWordValue)
                
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    
    }
    
    func isStringEmpty(stringValue:String) -> Bool {
        
        let cleanString = stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var returnValue = false
        if cleanString.isEmpty == true {
            returnValue = true
            return returnValue
        }
        return returnValue
    }
    
    @IBOutlet weak var keywordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

