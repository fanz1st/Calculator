#if MATH_FOUNDATION
import Foundation
#endif

#if MATH_DARWIN
import Darwin.C.math
#endif

#if MATH_GLIBC
import Glibc
#endif

/// Computes the sine of arg (measured in radians).
///
/// - Parameter float: floating point value representing an angle in radians
/// - Returns: If no errors occur, the sine of arg (sin(arg)) in the range [-1 ; +1], is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
/// If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func sin(_ angleRad: Float) -> Float {
    #if MATH_DARWIN
    return Darwin.sinf(angleRad)
    #endif

    #if MATH_GLIBC
    return Glibc.sinf(angleRad)
    #endif

    #if MATH_FOUNDATION
    return Foundation.sinf(angleRad)
    #endif
}

/// Computes the sine of arg (measured in radians).
///
/// - Parameter double: floating point value representing an angle in radians
/// - Returns: If no errors occur, the sine of arg (sin(arg)) in the range [-1 ; +1], is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
/// If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func sin(_ angleRad: Double) -> Double {
    #if MATH_DARWIN
    return Darwin.sin(angleRad)
    #endif

    #if MATH_GLIBC
    return Glibc.sin(angleRad)
    #endif

    #if MATH_FOUNDATION
    return Foundation.sin(angleRad)
    #endif
}
