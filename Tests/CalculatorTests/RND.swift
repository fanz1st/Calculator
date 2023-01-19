//
//  RND.swift
//
//
//  Created by Calculator on 26.07.19.
//

func rnd(_ count: Int, in range: ClosedRange<Float> = -1e-9...1e9) -> [Float] {
    (0..<count).map { _ in Float.random(in: range) }
}

func rndDecimal(_ count: Int, in range: ClosedRange<Int> = -10_000_000...10_000_000) -> [Float] {
    (0..<count).map { _ in Float(Int.random(in: range)) }
}
