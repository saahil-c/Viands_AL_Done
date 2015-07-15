//
//  ViandsAPI.swift
//  Viands_IOS
//
//  Created by Saahil Chhabria on 07/07/15.
//  Copyright (c) 2015 Saahil Chhabria. All rights reserved.
//

import Foundation

class ViandsAPI
{
    func post(params : Dictionary<String, String>, url : String, postCompleted : (succeeded: Bool, msg: String) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            var msg = "No message"
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
                postCompleted(succeeded: false, msg: "Error")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    print("Okay, the parsedJSON is here")
                    if let error = parseJSON["err"]  as? Bool {
                        print("Error is here\n")
                        print(error)
                    
                    if let message = parseJSON["message"] as? String {
                        print("message is here\n")
                        print(message)
                    
                    if let user = parseJSON["user"] as? NSDictionary{
                        print("User is here\n")
                        print(user)
                        if let name = user["name"] as? String {
                            print("name is here\n")
                            print(name)
                        
                        if let email = user["email"] as? String {
                            print("email is here\n")
                            print(email)
                        
                        if let v = user["_id"] as? String {
                            print("id is here \n")
                            print(v)
                        }
                    }
                }
            }
        }
    }
}
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                    postCompleted(succeeded: false, msg: "Error")
                }
            }

            })
        task.resume()
    }
    func get() {
        let urlPath = URL.restaurantsServerUrl
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            var err: NSError?
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error:&err) as? NSDictionary {
                if(err != nil) {
                    // If there is an error parsing JSON, print it to the console
                    print("JSON Error \(err!.localizedDescription)")
                }
                else {
                    let qos = Int(QOS_CLASS_USER_INITIATED.value)
                    dispatch_async(dispatch_get_global_queue(qos, 0), { () -> Void in
                        print("Connection carried")
                        let result = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        if let message = jsonResult["message"] as? String {
                            print("Check for message if it is before user")
                             print("message : \(message)")
                            print(result)
                           
                    
                    }
                   
                   
                })
            }

        // The task is just an object with all these properties set
        // In order to actually make the web request, we need to "resume"
        
            }
    })
        task.resume()
}
}
    
   