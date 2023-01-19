#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Computes the largest integer value not greater than arg.
///
/// - Parameter float: floating point value
/// - Returns: If no errors occur, the largest integer value not greater than arg, that is ⌊arg⌋, is returned.
public func floor(_ float: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.floorf(float)
    #endif

    #if Calculator_GLIBC
    return Glibc.floorf(float)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.floorf(float)
    #endif
}

/// Computes the largest integer value not greater than arg.
///
/// - Parameter double: floating point value
/// - Returns: If no errors occur, the largest integer value not greater than arg, that is ⌊arg⌋, is returned.
public func floor(_ double: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.floor(double)
    #endif

    #if Calculator_GLIBC
    return Glibc.floor(double)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.floor(double)
    #endif
}
