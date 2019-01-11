//
//  Result.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

public enum Result<Value, Error: Swift.Error> {
    case value(Value), error(Error)
}
