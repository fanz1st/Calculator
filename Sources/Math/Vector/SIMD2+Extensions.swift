//
//  SIMD2+Extensions.swift
//
//
//  Created by Math on 25.08.19.
//

extension SIMD2: Sequence { }

extension SIMD2 where Scalar: FloatingPoint {
    @inlinable public var isNaN: Bool {
        x.isNaN || y.isNaN
    }
}

extension SIMD2 where Scalar == Double {
    @inlinable public var length: Scalar {
        Math.length(self)
    }

    @inlinable public var normalized: SIMD2<Scalar> {
        normalize(self)
    }
}

extension SIMD2 where Scalar == Float {
    @inlinable public var length: Scalar {
        Math.length(self)
    }

    @inlinable public var normalized: SIMD2<Scalar> {
        normalize(self)
    }
}
