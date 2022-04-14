////
////  UpdateConcoctions.swift
////  Brotherhoold Alchemist SwiftUI
////
////  Created by Dave Poirier on 2022-04-09.
////  Copyright © 2022 Dave Poirier. All rights reserved.
////
//
//import Foundation
//
//class UpdateConcoctions: Operation {
//    
//    let transientState: ModelState
//    let onCompletion: (ModelState) -> Void
//
//    init(transientState providedState: ModelState,
//         onCompletion providedCompletion: @escaping (ModelState) -> Void
//    ) {
//        transientState = providedState
//        onCompletion = providedCompletion
//    }
//    
//    override func main() {
//        if isCancelled { return }
//        
//        let newState = StateTransitions.updateSelectedConcoctions(
//            transientState,
//            isCancelled: { self.isCancelled }
//        )
//        
//        if isCancelled { return }
//        DispatchQueue.main.async {
//            self.onCompletion(newState)
//        }
//    }
//}
