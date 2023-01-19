#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Computes hyperbolic sine of arg.
///
/// - Parameter float:     floating point value representing a hyperbolic angle
/// - Returns: If no errors occur, the hyperbolic sine of arg (sinh(arg), or (e^arg*-e-arg)/2) is returned.
/// If a range error due to overflow occurs, ±HUGE_VAL, ±HUGE_VALF, or ±HUGE_VALL is returned.
/// If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func sinh(_ float: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.sinhf(float)
    #endif

    #if Calculator_GLIBC
    return Glibc.sinhf(float)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.sinhf(float)
    #endif
}

/// Computes hyperbolic sine of arg.
///
/// - Parameter double:     floating point value representing a hyperbolic angle
/// - Returns: If no errors occur, the hyperbolic sine of arg (sinh(arg), or (e^arg*-e-arg)/2) is returned.
/// If a range error due to overflow occurs, ±HUGE_VAL, ±HUGE_VALF, or ±HUGE_VALL is returned.
/// If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func sinh(_ double: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.sinh(double)
    #endif

    #if Calculator_GLIBC
    return Glibc.sinh(double)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.sinh(double)
    #endif
}
