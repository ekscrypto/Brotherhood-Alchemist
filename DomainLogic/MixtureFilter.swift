//
//  MixtureFilter.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-05-04.
//  Copyright © 2023 Dave Poirier. All rights reserved.
//

import Foundation

final actor MixtureFilter {
    
    private var ongoingFilterRevision: Int64 = .min
    private var ongoingFilter: Task<[Mixture], Error>?
    

}
