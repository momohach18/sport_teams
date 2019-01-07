//
//  JsonFileReader.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

class JsonFileReaded {
    init(fileName: String) {
        let filePath = Bundle(for: JsonFileReaded.self).path(forResource: fileName, ofType: "json")
        data = FileManager().contents(atPath: filePath!)!
    }
    let data: Data
}
