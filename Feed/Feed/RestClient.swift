//
//  RestClient.swift
//  Feed
//
//  Created by Brian Wang on 9/26/15.
//  Copyright © 2015 TAAHA. All rights reserved.
//

import Foundation

class RestClient {
    
    private var url: NSURL?
    private var session: NSURLSession
    
    internal init(url: String) {
        self.url = NSURL(string: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.session = NSURLSession(configuration: config)
        
    }
    
    internal func get() -> String? {
        let request = NSMutableURLRequest(URL: url!)
        
        var content: String!
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if let data = data {
                if let loadedContent = NSString(data: data, encoding: NSASCIIStringEncoding) {
                    content = loadedContent as String
                    return
                }
            }
            
        }
        
        task.resume()

        if content != nil {
            return content
        }
        
        return content
    }
    
    internal func post(params: String) -> String? {
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = params.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)
        
        var content: String!
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if let data = data {
                if let loadedContent = NSString(data: data, encoding: NSASCIIStringEncoding) {
                    content = loadedContent as String
                    return
                }
            }
            
        }
        
        task.resume()
        
        if content != nil {
            return content
        }
        
        return content
    }
    
    internal func setUrl(url: String) {
        self.url = NSURL(string: url)
    }
}