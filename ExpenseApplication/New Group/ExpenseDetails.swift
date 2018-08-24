//
//  ExpenseDetails.swift
//  ExpenseApplication
//
//  Created by Weston Verhulst on 8/24/18.
//  Copyright © 2018 Weston Verhulst. All rights reserved.
//

import UIKit

struct Expense: Codable {
    var title: String
    var price: String
    var date: String
    
    static func retrieve() -> [Expense] {
        guard let fileURL = Bundle.main.url(forResource: "ExpenseDetails", withExtension: "json") else { return [] }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            return try decoder.decode([Expense].self, from: data)
        } catch let error {
            print(error)
            return []
        }
    }
}
