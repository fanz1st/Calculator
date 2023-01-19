#if MATH_FOUNDATION
import Foundation
#endif

#if MATH_DARWIN
import Darwin.C.math
#endif

#if MATH_GLIBC
import Glibc
#endif

///  Computes the inverse hyperbolic cosine of arg.
///
/// - Parameter double:     floating point value representing the area of a hyperbolic sector
/// - Returns: If no errors occur, the inverse hyperbolic cosine of arg (cosh-1
///    (arg), or arcosh(arg)) on the interval [0, +∞], is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
public func acosh(_ double: Double) -> Double {
    #if MATH_DARWIN
    return Darwin.acosh(double)
    #endif

    #if MATH_GLIBC
    return Glibc.acosh(double)
    #endif

    #if MATH_FOUNDATION    
    return Foundation.acosh(double)
    #endif
}

///  Computes the inverse hyperbolic cosine of arg.
///
/// - Parameter float:     floating point value representing the area of a hyperbolic sector
/// - Returns: If no errors occur, the inverse hyperbolic cosine of arg (cosh-1
///    (arg), or arcosh(arg)) on the interval [0, +∞], is returned.
/// If a domain error occurs, an implementation-defined value is returned (NaN where supported).
public func acosh(_ float: Float) -> Float {
    #if MATH_DARWIN
    return Darwin.acoshf(float)
    #endif

    #if MATH_GLIBC
    return Glibc.acoshf(float)
    #endif

    #if MATH_FOUNDATION    
    return Foundation.acoshf(float)
    #endif
}
