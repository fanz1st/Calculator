#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Computes the absolute value of a floating point value arg.
///
/// - Parameter float:     floating point value
/// - Returns: If successful, returns the absolute value of arg (|arg|). The value returned is exact and does not depend on any rounding modes.
public func abs(_ float: Float) -> Float {
    fabsf(float)
}

/// Computes the absolute value of a floating point value arg.
///
/// - Parameter double:     floating point value
/// - Returns: If successful, returns the absolute value of arg (|arg|). The value returned is exact and does not depend on any rounding modes.
public func abs(_ double: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.fabs(double)
    #endif

    #if Calculator_GLIBC
    return Glibc.fabs(double)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.fabs(double)
    #endif
}
