//
//  mod.swift
//  
//
//  Created by Antonio Pantaleo on 02/12/25.
//

public func mod<N: BinaryInteger>(_ a: N, _ b: N) -> N {
    let r = a % b
    return r >= 0 ? r : r + b
}
