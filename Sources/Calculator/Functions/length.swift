//
//  length.swift
//  Calculator
//
//  Created by Calculator on 26.08.19.
//

#if FRB_Calculator_USE_SIMD
import func simd.simd_length
import struct simd.simd_quatf
import struct simd.simd_quatd
#endif

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: SIMD2<Double>) -> Double {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: SIMD2<Float>) -> Float {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: SIMD3<Double>) -> Double {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y +
                    x.z * x.z)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: SIMD3<Float>) -> Float {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y +
                    x.z * x.z)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: SIMD4<Double>) -> Double {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y +
                    x.z * x.z +
                    x.w * x.w)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: SIMD4<Float>) -> Float {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y +
                    x.z * x.z +
                    x.w * x.w)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: Quat4f) -> Float {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x.storage)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y +
                    x.z * x.z +
                    x.w * x.w)
    #endif
}

/// Computes the length of the argument.
/// For scalar components `length(x)` is equivalent to `abs(x)`.
/// - Parameter float: a float argument
/// - Returns: the distance between the argument and the origin.
@inlinable
public func length(_ x: Quat4d) -> Double {
    #if FRB_Calculator_USE_SIMD
    return simd_length(x.storage)
    #else
    return sqrt(x.x * x.x +
                    x.y * x.y +
                    x.z * x.z +
                    x.w * x.w)
    #endif
}
