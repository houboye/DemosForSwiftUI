//
//  Block.swift
//  SwiftUIDemos
//
//  Created by BY H on 2023/10/23.
//

import UIKit

protocol Block {
    associatedtype Value
    var number: Value { get set }
}
