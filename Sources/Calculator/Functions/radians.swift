/// Converts degress to radians.
///
/// - Parameter degrees: an angle (in degrees)
/// - Returns: the argument converted to radians.
public func radians(_ degrees: Float) -> Float { degrees * kDegreeToRadians32 }

/// Converts degress to radians.
///
/// - Parameter degrees: an angle (in degrees)
/// - Returns: the argument converted to radians.
public func radians(_ degrees: Double) -> Double { degrees * kDegreeToRadians64 }

@inline(__always)
public func radians(_ degrees: Vec3f) -> Vec3f {
    Vec3f(x: Calculator.radians(degrees.x),
          y: Calculator.radians(degrees.y),
          z: Calculator.radians(degrees.z))
}
