#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Computes the common (base-10) logarithm of arg.
///
/// - Parameter float:     floating point value
/// - Returns: If no errors occur, the common (base-10) logarithm of arg (log_10(arg) or lg(arg)) is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
/// If a pole error occurs, -HUGE_VAL, -HUGE_VALF, or -HUGE_VALL is returned.
public func log10(_ float: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.log10f(float)
    #endif

    #if Calculator_GLIBC
    return Glibc.log10f(float)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.log10f(float)
    #endif
}

/// Computes the common (base-10) logarithm of arg.
///
/// - Parameter double:     floating point value
/// - Returns: If no errors occur, the common (base-10) logarithm of arg (log_10(arg) or lg(arg)) is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
/// If a pole error occurs, -HUGE_VAL, -HUGE_VALF, or -HUGE_VALL is returned.
public func log10(_ double: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.log10(double)
    #endif

    #if Calculator_GLIBC
    return Glibc.log10(double)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.log10(double)
    #endif
}
