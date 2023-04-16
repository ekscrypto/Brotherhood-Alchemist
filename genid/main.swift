//
//  main.swift
//  genid
//
//  Created by Dave Poirier on 2023-04-15.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

let randomId = Int64.random(in: Int64.min ... Int64.max)
let formattedId = String(format: "0x%08X", randomId)
print(formattedId)

