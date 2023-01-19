//
//  Matrix+Quaternion.swift
//  Math
//
//  Created by Math on 27.08.19.
//

extension Mat4x4f {
    /// Creates a new matrix from the specified quaternion.
    /// Quaternion will be normalized.
    public init(orientation quaternion: Quat4f) {
        self = matrix4x4(from: quaternion.normalized)
    }

    /// Construct a quaternion from a 4x4 rotation `matrix`.
    ///
    /// The last row and column of the matrix are ignored. This
    /// function is equivalent to calling simd_quaternion with the upper-left 3x3
    /// sub-matrix.
    @inlinable public var quaternion: Quat4f {
        Math.quaternion(matrix: self)
    }
}
