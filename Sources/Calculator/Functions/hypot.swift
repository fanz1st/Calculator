#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

/// Returns the hypotenuse of a right-angled triangle whose legs are x and y.
/// - Parameter x: x
/// - Parameter y: y
public func hypot(_ x: Float, _ y: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.hypotf(x, y)
    #endif

    #if Calculator_GLIBC
    return Glibc.hypotf(x, y)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.hypotf(x, y)
    #endif
}

/// Returns the hypotenuse of a right-angled triangle whose legs are x and y.
/// - Parameter x: x
/// - Parameter y: y
public func hypot(_ x: Double, _ y: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.hypot(x, y)
    #endif

    #if Calculator_GLIBC
    return Glibc.hypot(x, y)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.hypot(x, y)
    #endif
}
