//
//  PageManager.swift
//  PDFViewerApp
//
//  Created by Mohamed Elbana on 11/10/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import Foundation

let PAGE = PageManager.shared

class PageManager {
    
    let defaults = UserDefaults.standard
    let key = "LastPageNumber"
    
    static let shared = PageManager()
    
    func save(_ pageNo: Int) {
        defaults.set(pageNo, forKey: key)
        defaults.synchronize()
    }
    
    func get() -> Int {
        if defaults.object(forKey: key) != nil {
            return defaults.object(forKey: key) as! Int
        }
        return 0
    }
    
    func delete() {
        if defaults.object(forKey: key) != nil{
            defaults.removeObject(forKey: key)
        }
    }
}

