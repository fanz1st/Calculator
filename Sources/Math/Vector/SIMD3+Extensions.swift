//
//  SIMD3.swift
//
//
//  Created by Math on 25.08.19.
//

extension SIMD3: Sequence { }

extension SIMD3 where Scalar: FloatingPoint {
    @inlinable public var isNaN: Bool {
        x.isNaN || y.isNaN || z.isNaN
    }
}

extension SIMD3 where Scalar == Double {
    @inlinable public var length: Scalar {
        Math.length(self)
    }

    @inlinable public var normalized: SIMD3<Scalar> {
        normalize(self)
    }
}

extension SIMD3 where Scalar == Float {
    @inlinable public var length: Scalar {
        Math.length(self)
    }

    @inlinable public var normalized: SIMD3<Scalar> {
        normalize(self)
    }
}
