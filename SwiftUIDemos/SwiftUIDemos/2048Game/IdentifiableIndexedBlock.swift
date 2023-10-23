//
//  IdentifiableIndexedBlock.swift
//  SwiftUIDemos
//
//  Created by BY H on 2023/10/23.
//

import Foundation

struct IdentifiableIndexedBlock : Identifiable {
    
    typealias ID = String
    typealias IdentifiedValue = IndexedBlock<IdentifiedBlock>
    
    static var uniqueBlankId = 0
    
    let indexedBlock: IndexedBlock<IdentifiedBlock>
    
    var id: Self.ID {
        if let id = indexedBlock.item?.id {
            return "\(id)"
        }
        
        // TODO: (Refactor) Don't mix two types of block views.
        IdentifiableIndexedBlock.uniqueBlankId += 1
        return "Blank_\(IdentifiableIndexedBlock.uniqueBlankId)"
    }
    
    var identifiedValue: Self.IdentifiedValue {
        return indexedBlock
    }
    
}
