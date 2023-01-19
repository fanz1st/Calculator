#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Computes the inverse hyperbolic tangent of arg.
///
/// - Parameter float: floating point value representing the area of a hyperbolic sector
/// - Returns: If no errors occur, the inverse hyperbolic tangent of arg (tanh^-1(arg), or artanh(arg)), is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
/// If a pole error occurs, ±HUGE_VAL, ±HUGE_VALF, or ±HUGE_VALL is returned (with the correct sign).
/// If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func atanh(_ float: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.atanhf(float)
    #endif

    #if Calculator_GLIBC
    return Glibc.atanhf(float)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.atanhf(float)
    #endif
}

/// Computes the inverse hyperbolic tangent of arg.
///
/// - Parameter double: floating point value representing the area of a hyperbolic sector
/// - Returns: If no errors occur, the inverse hyperbolic tangent of arg (tanh^-1(arg), or artanh(arg)), is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
/// If a pole error occurs, ±HUGE_VAL, ±HUGE_VALF, or ±HUGE_VALL is returned (with the correct sign).
/// If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func atanh(_ double: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.atanh(double)
    #endif

    #if Calculator_GLIBC
    return Glibc.atanh(double)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.atanh(double)
    #endif
}
