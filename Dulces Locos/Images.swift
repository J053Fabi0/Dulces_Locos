//
//  File.swift
//  Dulces Locos
//
//  Created by Jose Fabio_ on 05/08/17.
//  Copyright © 2017 com.yoyomero.josefabio. All rights reserved.
//

import Foundation
class Images {
    func getImagesArray() -> [String] {
        let path = Bundle.main.resourcePath!
        let fm = FileManager.default
        var returnArray = [String]()
        let imagePath = path + "/products"
        
        if let directoryAndFileNames = try? fm.contentsOfDirectory(atPath: imagePath) {
            let results = directoryAndFileNames.filter({ (products) -> Bool in
                let index = products.index(products.endIndex, offsetBy: -5)
                let ext = products.substring(from: index)
                if ext.contains("png") {
                    return true
                }
                else {
                    return false
                }
            })
            print(results)
            
            returnArray = results
        }
        else {
            print("empty")
        }
        return returnArray
    }
}
