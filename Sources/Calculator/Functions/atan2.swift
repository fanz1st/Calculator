#if Calculator_FOUNDATION
import Foundation
#endif

#if Calculator_DARWIN
import Darwin.C.math
#endif

#if Calculator_GLIBC
import Glibc
#endif

///  The atan2() function computes the principal value of the arc tangent of y/x,
///  using the signs of both arguments to determine the quadrant of the return value.
/// - Parameter y: y
/// - Parameter x: x
public func atan2(_ y: Double, _ x: Double) -> Double {
    #if Calculator_DARWIN
    return Darwin.atan2(y, x)
    #endif

    #if Calculator_GLIBC
    return Glibc.atan2(y, x)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.atan2(y, x)
    #endif
}

///  The atan2() function computes the principal value of the arc tangent of y/x,
///  using the signs of both arguments to determine the quadrant of the return value.
/// - Parameter y: y
/// - Parameter x: x
public func atan2(_ y: Float, _ x: Float) -> Float {
    #if Calculator_DARWIN
    return Darwin.atan2f(y, x)
    #endif

    #if Calculator_GLIBC
    return Glibc.atan2f(y, x)
    #endif

    #if Calculator_FOUNDATION
    return Foundation.atan2f(y, x)
    #endif
}