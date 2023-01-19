#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif
/// Computes the value of base 2 raised to the power exponent.
public func pow2(_ exponent: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.powf(2, exponent)
    #endif

    #if Calculator_GLIBC
    return Glibc.powf(2, exponent)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.powf(2, exponent)
    #endif
}

/// Computes the value of base 2 raised to the power exponent.
public func pow2(_ exponent: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.pow(2, exponent)
    #endif

    #if Calculator_GLIBC
    return Glibc.pow(2, exponent)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.pow(2, exponent)
    #endif
}
