//
//  sign.swift
//  Calculator
//
//  Created by Calculator on 26.08.19.
//

#if FRB_Calculator_USE_SIMD
import func simd.simd_sign
#endif

/// Returns -1 if `x < 0`, +1 if `x > 0`, and 0 otherwise (`sign(NaN)` is 0).
public func sign(_ x: Double) -> Double {
    #if FRB_Calculator_USE_SIMD
    return simd_sign(x)
    #else
    return (x == 0 || x != x) ? 0 : copysign(1, x)
    #endif
}

/// Returns -1 if `x < 0`, +1 if `x > 0`, and 0 otherwise (`sign(NaN)` is 0).
public func sign(_ x: Float) -> Float {
    #if FRB_Calculator_USE_SIMD
    return simd_sign(x)
    #else
    return (x == 0 || x != x) ? 0 : copysign(1, x)
    #endif
}
