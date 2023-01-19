#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Composes a floating point value with the magnitude of x and the sign of y.
///
/// - Parameters:
///   - x:     floating point value
///   - y:     floating point value
/// - Returns: If no errors occur, the floating point value with the magnitude of x and the sign of y is returned.
///            If x is NaN, then NaN with the sign of y is returned.
///            If y is -0, the result is only negative if the implementation supports the signed zero consistently in
///            arithmetic operations.
public func copysign(_ x: Double, _ y: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.copysign(x, y)
    #endif

    #if Calculator_GLIBC
    return Glibc.copysign(x, y)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.copysign(x, y)
    #endif
}

/// Composes a floating point value with the magnitude of x and the sign of y.
///
/// - Parameters:
///   - x:     floating point value
///   - y:     floating point value
/// - Returns: If no errors occur, the floating point value with the magnitude of x and the sign of y is returned.
///            If x is NaN, then NaN with the sign of y is returned.
///            If y is -0, the result is only negative if the implementation supports the signed zero consistently in
///            arithmetic operations.
public func copysign(_ x: Float, _ y: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.copysignf(x, y)
    #endif

    #if Calculator_GLIBC
    return Glibc.copysignf(x, y)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.copysignf(x, y)
    #endif
}
