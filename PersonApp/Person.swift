//
//  Person.swift
//  PersonApp
//
//  Created by Zachary Friss on 2/3/15.
//  Copyright (c) 2015 Zachary Friss. All rights reserved.
//

import Foundation

class Person {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var country: String
    var companyName: String
    var ipAddress: String
    var jobTitle: String
    var bitcoinAddress: String
    var city: String
    var state: String
    var zipcode: String
    var address: String
    
    
    init(id: String, firstName: String, lastName: String, email: String, country: String, companyName: String, ipAddress: String, jobTitle: String, bitcoinAddress: String, city: String, state: String, zipcode: String, address: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.country = country
        self.companyName = companyName
        self.ipAddress = ipAddress
        self.jobTitle = jobTitle
        self.bitcoinAddress = bitcoinAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.address = address
    }
    
    class func peopleFromJSON(allResults: NSArray) -> [Person] {
        
        var people = [Person]()
        
        if allResults.count>0 {
            
            for result in allResults {
        
                let id = result["id"] as? String ?? ""
                let firstName = result["firstName"] as? String ?? ""
                let lastName = result["lastName"] as? String ?? ""
                let email = result["email"] as? String ?? ""
                let country = result["country"] as? String ?? ""
                let companyName = result["companyName"] as? String ?? ""
                let ipAddress = result["ipAddress"] as? String ?? ""
                let jobTitle = result["jobTitle"] as? String ?? ""
                let bitcoinAddress = result["bitcoinAddress"] as? String ?? ""
                let city = result["city"] as? String ?? ""
                let state = result["state"] as? String ?? ""
                let zipcode = result["zipcode"] as? String ?? ""
                let address = result["address"] as? String ?? ""
                
                var newPerson = Person(id: id, firstName: firstName, lastName: lastName, email: email, country: country, companyName: companyName, ipAddress: ipAddress, jobTitle: jobTitle, bitcoinAddress: bitcoinAddress, city: city, state: state, zipcode: zipcode, address: address)
                
                people.append(newPerson)
            }
        }
        return people
    }
}


