#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Computes the principal value of the arc cosine of arg.
///
/// - Parameter float: floating point value
/// - Returns: If no errors occur, the arc cosine of arg (arccos(arg)) in the range [0 ; π], is returned.
///               If a domain error occurs, an implementation-defined value is returned (NaN where supported).
///                If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func acos(_ float: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.acosf(float)
    #endif

    #if Calculator_GLIBC
    return Glibc.acosf(float)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.acosf(float)
    #endif
}

/// Computes the principal value of the arc cosine of arg.
///
/// - Parameter double: floating point value
/// - Returns: If no errors occur, the arc cosine of arg (arccos(arg)) in the range [0 ; π], is returned.
///               If a domain error occurs, an implementation-defined value is returned (NaN where supported).
///                If a range error occurs due to underflow, the correct result (after rounding) is returned.
public func acos(_ double: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.acos(double)
    #endif

    #if Calculator_GLIBC
    return Glibc.acos(double)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.acos(double)
    #endif
}
