//
//  APIController.swift
//  PersonApp
//
//  Created by Zachary Friss on 2/3/15.
//  Copyright (c) 2015 Zachary Friss. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSArray)
}

class APIController {
    
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    func get(path: String) {
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            let results: NSArray = jsonResult as NSArray
            self.delegate.didReceiveAPIResults(jsonResult) // THIS IS THE NEW LINE!!
        })
        task.resume()
    }
    func searchPeople(searchTerm: String) {
        // Now escape anything else that isn't URL-friendly
        if let escapedSearchTerm = searchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music&entity=album"
            get(urlPath)
        }
    }
    
    func getPeopleById(personId: String) {
        let urlPath = "http://the.student.rit.edu:8080/person/\(personId)"
        get(urlPath)
    }
    
    func getPeople() {
        let urlPath = "http://the.student.rit.edu:8080/person"
        get(urlPath)
    }


}