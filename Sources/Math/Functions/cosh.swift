#if MATH_FOUNDATION
import Foundation
#endif

#if MATH_DARWIN
import Darwin.C.math
#endif

#if MATH_GLIBC
import Glibc
#endif

/// Computes the hyperbolic cosine of arg.
///
/// - Parameter float: floating point value representing a hyperbolic angle
/// - Returns: If no errors occur, the hyperbolic cosine of arg (cosh(arg), or (e^arg+e^-arg)/2) is returned.
/// If a range error due to overflow occurs, +HUGE_VAL, +HUGE_VALF, or +HUGE_VALL is returned.
public func cosh(_ float: Float) -> Float {
    #if MATH_DARWIN
    return Darwin.coshf(float)
    #endif

    #if MATH_GLIBC
    return Glibc.coshf(float)
    #endif

    #if MATH_FOUNDATION
    return Foundation.coshf(float)
    #endif
}

/// Computes the hyperbolic cosine of arg.
///
/// - Parameter double: floating point value representing a hyperbolic angle
/// - Returns: If no errors occur, the hyperbolic cosine of arg (cosh(arg), or (e^arg+e^-arg)/2) is returned.
/// If a range error due to overflow occurs, +HUGE_VAL, +HUGE_VALF, or +HUGE_VALL is returned.
public func cosh(_ double: Double) -> Double {
    #if MATH_DARWIN
    return Darwin.cosh(double)
    #endif

    #if MATH_GLIBC
    return Glibc.cosh(double)
    #endif

    #if MATH_FOUNDATION
    return Foundation.cosh(double)
    #endif
}
