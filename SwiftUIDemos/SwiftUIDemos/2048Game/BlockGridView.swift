//
//  BlockGridView.swift
//  SwiftUIDemos
//
//  Created by BY H on 2023/10/23.
//

import SwiftUI

extension AnyTransition {
    static func blockAppear(from: Edge) -> AnyTransition {
        return .asymmetric(
            insertion: AnyTransition.opacity
                .combined(with: .move(edge: from)),
            removal: .identity)
    }
}

struct BlockGridView : View {
    
    typealias SupportingMatrix = BlockMatrix<IdentifiedBlock>
    
    let matrix: Self.SupportingMatrix
    let blockEnterEdge: Edge
    
    func createBlock(_ block: IdentifiedBlock?) -> BlockView {
        if let block = block {
            return BlockView(number: block.number)
        }
        return BlockView.blank()
    }
    
    // FIXME: This is existed as a workaround for a Swift compiler bug.
    func zIndex(_ block: IdentifiedBlock?) -> Double {
        if block == nil {
            return 1.0
        }
        return 1000.0
    }
    
    var body: some View {
        ZStack {
            ForEach(
                self.matrix.flatten.map { IdentifiableIndexedBlock(indexedBlock: $0) }
            ) { block in
                self.createBlock(block.indexedBlock.item)
                    .frame(width: 65, height: 65, alignment: .center)
                    .position(x: CGFloat(block.indexedBlock.index.0) * (65 + 12) + 32.5 + 12,
                              y: CGFloat(block.indexedBlock.index.1) * (65 + 12) + 32.5 + 12)
                    .zIndex(self.zIndex(block.indexedBlock.item))
                    .transition(.blockAppear(from: self.blockEnterEdge))
//                    .animation(block.item == nil ? nil : .spring(mass: 1, stiffness: 400, damping: 56, initialVelocity: 0))
            }
        }
        .frame(width: 320, height: 320, alignment: .center)
        .background(Rectangle().fill(Color(red:0.72, green:0.66, blue:0.63, opacity:1.00)))
        .clipped()
        .clipShape(.rect(cornerRadius: 6))
        
    }
    
}

#if DEBUG
struct BlockGridView_Previews : PreviewProvider {
    
    static var matrix: BlockGridView.SupportingMatrix {
        var _matrix = BlockGridView.SupportingMatrix()
        _matrix.place(IdentifiedBlock(id: 1, number: 2), to: (2, 0))
        _matrix.place(IdentifiedBlock(id: 2, number: 2), to: (3, 0))
        _matrix.place(IdentifiedBlock(id: 3, number: 8), to: (1, 1))
        _matrix.place(IdentifiedBlock(id: 4, number: 4), to: (2, 1))
        _matrix.place(IdentifiedBlock(id: 5, number: 512), to: (3, 3))
        _matrix.place(IdentifiedBlock(id: 6, number: 1024), to: (2, 3))
        _matrix.place(IdentifiedBlock(id: 7, number: 16), to: (0, 3))
        _matrix.place(IdentifiedBlock(id: 8, number: 8), to: (1, 3))
        return _matrix
    }
    
    static var previews: some View {
        BlockGridView(matrix: matrix, blockEnterEdge: .top)
            .previewLayout(.sizeThatFits)
    }
    
}
#endif
