//
//  FunctionTests.swift
//  CalculatorTests
//
//  Created by Calculator on 26.08.19.
//

import func XCTest.XCTAssertNotNil
import func XCTest.XCTAssertEqual
import class XCTest.XCTestCase
import Calculator

final class FunctionTests: XCTestCase {
    func test_abs() {
        XCTAssertEqual(Calculator.abs(Double(-123)), 123)
        XCTAssertEqual(Calculator.abs(Float(-123)), 123)
    }
    func test_acos() {
        XCTAssertEqual(Calculator.acos(Double(0.5)), 1.0471975511965976, accuracy: 1e-14)
        XCTAssertEqual(Calculator.acos(Float(0.5)), 1.0471975, accuracy: 1e-6)
    }
    func test_acosh() {
        XCTAssertEqual(Calculator.acosh(Double(123)), 5.505315010967267)
        XCTAssertEqual(Calculator.acosh(Float(123)), 5.505315)
    }
    func test_asin() {
        XCTAssertEqual(Calculator.asin(Double(0.5)), 0.5235987755982988, accuracy: 1e-14)
        XCTAssertEqual(Calculator.asin(Float(0.5)), 0.5235988)
    }
    func test_asinh() {
        XCTAssertEqual(Calculator.asinh(Double(123)), 5.505348060078276, accuracy: 1e-14)
        XCTAssertEqual(Calculator.asinh(Float(123)), 5.505348)
    }
    func test_atan() {
        XCTAssertEqual(Calculator.atan(Double(123)), 1.5626664246149526)
        XCTAssertEqual(Calculator.atan(Float(123)), 1.5626664)
    }
    func test_atan2() {
        XCTAssertEqual(Calculator.atan2(Double(123), Double(123)), 0.7853981633974483)
        XCTAssertEqual(Calculator.atan2(Float(123), Float(123)), 0.7853982)
    }
    func test_atanh() {
        XCTAssertEqual(Calculator.atanh(Double(0.5)), 0.5493061443340549, accuracy: 1e-14)
        XCTAssertEqual(Calculator.atanh(Float(0.5)), 0.54930615)
    }
    func test_ceil() {
        XCTAssertEqual(Calculator.ceil(Double(123.78)), 124)
        XCTAssertEqual(Calculator.ceil(Float(123.69)), 124)
    }
    func test_clamp() {
        XCTAssertEqual(Calculator.clamp(Double(123), Double(1), Double(50)), 50)
        XCTAssertEqual(Calculator.clamp(Float(123), Float(1), Float(50)), 50)
    }
    func test_cos() {
        XCTAssertEqual(Calculator.cos(Double(123)), -0.8879689066918555)
        XCTAssertEqual(Calculator.cos(Float(123)), -0.8879689)
    }
    func test_cosh() {
        XCTAssertEqual(Calculator.cosh(Double.pi), 11.591953275521519)
        XCTAssertEqual(Calculator.cosh(Float.pi), 11.591951, accuracy: 1e-6)
    }
    func test_degrees() {
        XCTAssertEqual(Calculator.degrees(Double(123)), 7047.380880109125)
        XCTAssertEqual(Calculator.degrees(Float(123)), 7047.381)
    }
    func test_distance() {
        XCTAssertEqual(Calculator.distance(Double(123), Double(124)), 1)
        XCTAssertEqual(Calculator.distance(Float(123), Float(122)), 1)
    }
    func test_dot() {
        XCTAssertEqual(Calculator.dot(SIMD2<Double>(1, 2), SIMD2<Double>(3, 4)), 11.0)
        XCTAssertEqual(Calculator.dot(SIMD3<Double>(1, 2, 3), SIMD3<Double>(4, 5, 6)), 32.0)
        XCTAssertEqual(Calculator.dot(SIMD4<Double>(1, 2, 3, 4), SIMD4<Double>(5, 6, 7, 8)), 70.0)

        XCTAssertEqual(Calculator.dot(SIMD2<Float>(1, 2), SIMD2<Float>(3, 4)), 11.0)
        XCTAssertEqual(Calculator.dot(SIMD3<Float>(1, 2, 3), SIMD3<Float>(4, 5, 6)), 32.0)
        XCTAssertEqual(Calculator.dot(SIMD4<Float>(1, 2, 3, 4), SIMD4<Float>(5, 6, 7, 8)), 70.0)
    }
    func test_exp() {
        XCTAssertEqual(Calculator.exp(Double(13)), 442413.3920089205)
        XCTAssertEqual(Calculator.exp(Float(13)), 442413.4)
    }
    func test_exp2() {
        XCTAssertEqual(Calculator.exp2(Double(9)), 512.0)
        XCTAssertEqual(Calculator.exp2(Float(9)), 512.0)
    }
    func test_faceforward() {
        XCTAssertEqual(Calculator.faceforward(n: Double(1), i: Double(2), nref: Double(3)), -1)
        XCTAssertEqual(Calculator.faceforward(n: Float(1), i: Float(2), nref: Float(3)), -1.0)
    }
    func test_floor() {
        XCTAssertEqual(Calculator.floor(Double(123.45)), 123)
        XCTAssertEqual(Calculator.floor(Float(123.32)), 123)
    }
    func test_fract() {
        XCTAssertEqual(Calculator.fract(Double(123.34)), 0.3400000000000034)
        XCTAssertEqual(Calculator.fract(Float(123.56)), 0.55999756)
    }
    func test_hypot() {
        XCTAssertEqual(Calculator.hypot(Double(1), Double(2)), 2.23606797749979)
        XCTAssertEqual(Calculator.hypot(Float(1), Float(2)), 2.236068)
    }
    func test_isInfinite() {
        XCTAssertEqual(Calculator.isInfinite(Double(123)), false)
        XCTAssertEqual(Calculator.isInfinite(Float(123)), false)
    }
    func test_isNegativeInfinity() {
        XCTAssertEqual(Calculator.isNegativeInfinity(Double(123)), false)
        XCTAssertEqual(Calculator.isNegativeInfinity(Float(123)), false)
    }
    func test_isNegativeZero() {
        XCTAssertEqual(Calculator.isNegativeZero(Double(123)), false)
        XCTAssertEqual(Calculator.isNegativeZero(Float(123)), false)
    }
    func test_isPositiveInfinity() {
        XCTAssertEqual(Calculator.isPositiveInfinity(Double(123)), false)
        XCTAssertEqual(Calculator.isPositiveInfinity(Float(123)), false)
    }
    func test_isPositiveZero() {
        XCTAssertEqual(Calculator.isPositiveZero(Double(123)), false)
        XCTAssertEqual(Calculator.isPositiveZero(Float(123)), false)
    }
    func test_length() {
        XCTAssertEqual(Calculator.length(SIMD2<Double>(1, 2)), 2.23606797749979)
        XCTAssertEqual(Calculator.length(SIMD3<Double>(1, 2, 3)), 3.7416573867739413)
        XCTAssertEqual(Calculator.length(SIMD4<Double>(1, 2, 3, 4)), 5.477225575051661)

        XCTAssertEqual(Calculator.length(SIMD2<Float>(1, 2)), 2.236068)
        XCTAssertEqual(Calculator.length(SIMD3<Float>(1, 2, 3)), 3.7416575)
        XCTAssertEqual(Calculator.length(SIMD4<Float>(1, 2, 3, 4)), 5.477226)
    }
    func test_log() {
        XCTAssertEqual(Calculator.log(Double(123)), 4.812184355372417)
        XCTAssertEqual(Calculator.log(Float(123)), 4.8121843)
    }
    func test_log2() {
        XCTAssertEqual(Calculator.log2(Double(123)), 6.94251450533924)
        XCTAssertEqual(Calculator.log2(Float(123)), 6.9425144)
    }
    func test_log10() {
        XCTAssertEqual(Calculator.log10(Double(123)), 2.089905111439398)
        XCTAssertEqual(Calculator.log10(Float(123)), 2.089905)
    }
    func test_max() {
        XCTAssertEqual(Calculator.max(Double(123), Double(534)), 534)
        XCTAssertEqual(Calculator.max(Float(123), Float(33)), 123)
    }
    func test_min() {
        XCTAssertEqual(Calculator.min(Double(123), Double(22)), 22)
        XCTAssertEqual(Calculator.min(Float(123), Float(66)), 66)
    }
    func test_mix() {
        XCTAssertEqual(Calculator.mix(Double(123), Double(456), Double(18)), 6117.0)
        XCTAssertEqual(Calculator.mix(Float(123), Float(456), Float(222)), 74049.0)
    }
    func test_mod() {
        XCTAssertEqual(Calculator.mod(Double(123), Double(2)), 1.0)
        XCTAssertEqual(Calculator.mod(Float(123), Float(3)), 0.0)
    }
    func test_normalize() {
        XCTAssertEqual(Calculator.normalize(SIMD2<Double>(1, 2)), SIMD2<Double>(0.4472135954999579, 0.8944271909999159))
        XCTAssertEqual(Calculator.normalize(SIMD3<Double>(1, 2, 3)), SIMD3<Double>(0.2672612419124244, 0.5345224838248488, 0.8017837257372732))
        XCTAssertEqual(Calculator.normalize(SIMD4<Double>(1, 2, 3, 4)), SIMD4<Double>(0.18257418583505536, 0.3651483716701107, 0.5477225575051661, 0.7302967433402214))

        XCTAssertEqual(Calculator.normalize(SIMD2<Float>(1, 2)), SIMD2<Float>(0.4472136, 0.8944272))
        XCTAssertEqual(Calculator.normalize(SIMD3<Float>(1, 2, 3)), SIMD3<Float>(0.26726124, 0.5345225, 0.8017837))
        #if FRB_Calculator_USE_SIMD
        XCTAssertEqual(Calculator.normalize(SIMD4<Float>(1, 2, 3, 4)), SIMD4<Float>(0.18257417, 0.36514834, 0.5477225, 0.7302967))
        #else
        XCTAssertEqual(Calculator.normalize(SIMD4<Float>(1, 2, 3, 4)), SIMD4<Float>(0.18257418, 0.36514837, 0.5477226, 0.73029673))
        #endif
    }
    func test_pow() {
        XCTAssertEqual(Calculator.pow(Double(123), Double(2)), 15129.0)
        XCTAssertEqual(Calculator.pow(Float(123), Float(2)), 15129.0)
    }
    func test_pow2() {
        XCTAssertEqual(Calculator.pow2(Double(123)), 1.0633823966279327e+37)
        XCTAssertEqual(Calculator.pow2(Float(123)), 1.0633824e+37)
    }
    func test_radians() {
        XCTAssertEqual(Calculator.radians(Double(123)), 2.1467549799530254)
        XCTAssertEqual(Calculator.radians(Float(123)), 2.146755)
    }
    func test_reflect() {
        XCTAssertEqual(Calculator.reflect(Double(123), Double(123)), -3721611.0)
        XCTAssertEqual(Calculator.reflect(Float(123), Float(123)), -3721611.0)
    }
    func test_refract() {
        XCTAssertEqual(Calculator.refract(Double(123), Double(123), Double(123)), -457758152.500033)
        XCTAssertEqual(Calculator.refract(Float(123), Float(123), Float(123)), -4.5775814e+08)
    }
    func test_rsqrt() {
        XCTAssertEqual(Calculator.rsqrt(Double(123)), 0.09016696346674323)
        XCTAssertEqual(Calculator.rsqrt(Float(123)), 0.090166956, accuracy: 1e-8)
    }
    func test_sign() {
        XCTAssertEqual(Calculator.sign(Double(123)), 1.0)
        XCTAssertEqual(Calculator.sign(Float(-123)), -1.0)
    }
    func test_sin() {
        XCTAssertEqual(Calculator.sin(Double(123)), -0.45990349068959124)
        XCTAssertEqual(Calculator.sin(Float(123)), -0.45990348)
    }
    func test_sinh() {
        XCTAssertEqual(Calculator.sinh(Double(0.5)), 0.5210953054937474)
        XCTAssertEqual(Calculator.sinh(Float(0.5)), 0.5210953)
    }
    func test_smoothstep() {
        XCTAssertEqual(Calculator.smoothstep(Double(12), Double(24), Double(13)), 0.019675925925925927)
        XCTAssertEqual(Calculator.smoothstep(Float(12), Float(24), Float(13)), 0.019675927)
    }
    func test_sqrt() {
        XCTAssertEqual(Calculator.sqrt(Double(123)), 11.090536506409418)
        XCTAssertEqual(Calculator.sqrt(Float(123)), 11.090536)
    }
    func test_step() {
        XCTAssertEqual(Calculator.step(Double(123), Double(123)), 1.0)
        XCTAssertEqual(Calculator.step(Float(123), Float(123)), 1.0)
    }
    func test_tan() {
        XCTAssertEqual(Calculator.tan(Double(123)), 0.5179274715856551, accuracy: 1e-14)
        XCTAssertEqual(Calculator.tan(Float(123)), 0.51792747)
    }
    func test_tanh() {
        XCTAssertEqual(Calculator.tanh(Double(0.5)), 0.46211715726000974)
        XCTAssertEqual(Calculator.tanh(Float(0.5)), 0.46211717)
    }
}
