//
//  Matrix3x3.swift
//
//
//  Created by Math on 05.09.19.
//

@frozen
public struct Matrix3x3<Storage>: RandomAccessCollection, MutableCollection where Storage: Storage3x3Protocol, Storage.Value == Storage.Element {
    public typealias Element = Storage.Element
    public typealias Index = Storage.Index
    public typealias Value = Storage.Value
    public typealias Vector = Storage.Column

    @usableFromInline var storage: Storage

    public var startIndex: Index { storage.startIndex }
    public var endIndex: Index { storage.endIndex }
    public func index(after i: Index) -> Index { storage.index(after: i) }
    public func index(before i: Index) -> Index { storage.index(before: i) }

    @usableFromInline init(storage: Storage) {
        self.storage = storage
    }

    public init(diagonal: Vector) {
        self.storage = Storage(diagonal: diagonal)
    }

    public init(_ columns: [Vector]) {
        precondition(columns.count == 3, "Matrix needs exactly 3 Vector vectors")
        self.storage = Storage(columns)
    }

    public init(_ column0: Vector, _ column1: Vector, _ column2: Vector) {
        self.init([column0, column1, column2])
    }

    public init(_ values: [Storage.Value]) {
        precondition(values.count == 9, "Matrix needs exactly 9 values")
        self.init([Vector(values[0...2]),
                   Vector(values[3...5]),
                   Vector(values[6...8])])
    }

    public subscript(index: Index) -> Element {
        get { storage[index] }
        set { storage[index] = newValue }
    }

    public subscript(column: Int, row: Int) -> Value {
        get { storage[column, row] }
        set { storage[column, row] = newValue }
    }

    @inlinable public var columns: (Vector, Vector, Vector) {
        storage.columns
    }

    @inlinable public var elements: [Value] {
        [Value](AnyIterator(self.storage.makeIterator()))
    }

    @inlinable public func withForcedContiguousStorage<R>(_ body: (UnsafeBufferPointer<Element>) -> R) throws -> R? {
        // https://forums.swift.org/t/se-0256-introduce-mutable-contiguouscollection-protocol/22569/7
        if let result = withContiguousStorageIfAvailable(body) {
            return result
        }

        return ContiguousArray(self).withContiguousStorageIfAvailable(body)
    }

    @inlinable public mutating func withForcedContiguousMutableStorage<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) -> R) throws -> R? {
        // https://forums.swift.org/t/se-0256-introduce-mutable-contiguouscollection-protocol/22569/7
        if let result = withContiguousMutableStorageIfAvailable(body) {
            return result
        }

        var array = ContiguousArray(self)
        let result = array.withContiguousMutableStorageIfAvailable(body)
        for (idx, arrayIdx) in zip(self.indices, array.indices) {
            self[idx] = array[arrayIdx]
        }
        return result
    }
}

extension Matrix3x3: Equatable {
    public static func ==(lhs: Matrix3x3<Storage>, rhs: Matrix3x3<Storage>) -> Bool {
        lhs.storage == rhs.storage
    }
}

/*
 extension Matrix3x3 where Storage.Value: AdditiveArithmetic & FloatingPoint & Numeric {
 public init(rotation angleRadians: Storage.Value, axis: Vector) {
 // see: <GLKit.framework/.../Headers/GLKMatrix4.h>
 let v: Vector = normalize(axis)
 let icos: Storage.Value = cos(angleRadians)
 let icosp: Storage.Value = 1.0 - icos
 let isin: Storage.Value = sin(angleRadians)

 self.init(
 Vector( icos + icosp * v.x * v.x,
 icosp * v.x * v.y + v.z * isin,
 icosp * v.x * v.z - v.y * isin),
 Vector( icosp * v.x * v.y - v.z * isin,
 icos + icosp * v.y * v.y,
 icosp * v.y * v.z + v.x * isin),
 Vector( icosp * v.x * v.z + v.y * isin,
 icosp * v.y * v.z - v.x * isin,
 icos + icosp * v.z * v.z)
 )
 }

 public init(eulerAngles angles: Vector) {
 // see: https://en.wikipedia.org/wiki/Rotation_formalisms_in_three_dimensions#Conversion_formulae_between_formalisms
 // right handed coordinate system

 let sinϕ: Storage.Value = sin(angles.x)
 let sinθ: Storage.Value = sin(angles.y)
 let sinψ: Storage.Value = sin(angles.z)

 let cosϕ: Storage.Value = cos(angles.x)
 let cosθ: Storage.Value = cos(angles.y)
 let cosψ: Storage.Value = cos(angles.z)

 let m00: Storage.Value = cosθ * cosψ

 let m01: Storage.Value = -cosϕ * sinψ + sinϕ * sinθ * cosψ
 let m02: Storage.Value = sinϕ * sinψ + cosϕ * sinθ * cosψ

 let m10: Storage.Value = cosθ * sinψ
 let m11: Storage.Value = cosϕ * cosψ + sinϕ * sinθ * sinψ
 let m12: Storage.Value = -sinϕ * cosψ + cosϕ * sinθ * sinψ

 let m20: Storage.Value = -sinθ
 let m21: Storage.Value = sinϕ * cosθ
 let m22: Storage.Value = cosϕ * cosθ

 self.init(Vector(m00, m10, m20),
 Vector(m01, m11, m21),
 Vector(m02, m12, m22))
 }

 @inlinable public var rotationAngles: Vector {
 let rotX = atan2( self[1][2], self[2][2])
 let rotY = atan2(-self[0][2], hypot(self[1][2], self[2][2]))
 let rotZ = atan2( self[0][1], self[0][0])
 return Vector(rotX, rotY, rotZ)
 }
 }

 // MARK: - euler
 extension Matrix3x3 {
 @inlinable public var eulerAnglesXYZ: Vector {
 /// https://github.com/OGRECave/ogre/blob/master/OgreMain/src/OgreMatrix3.cpp#L995
 let yaw: Storage.Value
 let pitch: Storage.Value = radians(asin(self[0][2]))
 let roll: Storage.Value
 if pitch < radians(.halfPi) {
 if ( pitch > radians(-.halfPi) ) {
 yaw = atan2(-self[1][2], self[2][2])
 roll = atan2(-self[0][1], self[0][0])
 } else {
 // WARNING.  Not a unique solution.
 let fRmY: Storage.Value = atan2(self[1][0], self[1][1])
 roll = radians(0.0)  // any angle works
 yaw = roll - fRmY
 }
 } else {
 // WARNING.  Not a unique solution.
 let fRpY: Storage.Value = atan2(self[1][0], self[1][1])
 roll = radians(0.0)  // any angle works
 yaw = fRpY - roll
 }

 return Vector(yaw, pitch, roll)
 }

 @inlinable public var eulerAnglesXZY: Vector {
 /// https://github.com/OGRECave/ogre/blob/master/OgreMain/src/OgreMatrix3.cpp#L1030
 let yaw: Storage.Value
 let pitch: Storage.Value = asin(-self[0][1])
 let roll: Storage.Value
 if pitch < radians(.halfPi) {
 if pitch > radians(-.halfPi) {
 yaw = atan2(self[2][1], self[1][1])
 roll = atan2(self[0][2], self[0][0])
 } else {
 // WARNING.  Not a unique solution.
 let fRmY: Storage.Value = atan2(-self[2][0], self[2][2])
 roll = radians(0.0)  // any angle works
 yaw = roll - fRmY
 }
 } else {
 // WARNING.  Not a unique solution.
 let fRpY: Storage.Value = atan2(-self[2][0], self[2][2])
 roll = radians(0.0)  // any angle works
 yaw = fRpY - roll
 }
 return Vector(yaw, pitch, roll)
 }

 @inlinable public var eulerAnglesYXZ: Vector {
 /// https://github.com/OGRECave/ogre/blob/master/OgreMain/src/OgreMatrix3.cpp#L1065
 let yaw: Storage.Value
 let pitch: Storage.Value = asin(-self[1][2])
 let roll: Storage.Value
 if  pitch < radians(.halfPi) {
 if pitch > radians(-.halfPi) {
 yaw = atan2(self[0][2], self[2][2])
 roll = atan2(self[1][0], self[1][1])
 } else {
 // WARNING.  Not a unique solution.
 let fRmY: Storage.Value = atan2(-self[0][1], self[0][0])
 roll = radians(0.0)  // any angle works
 yaw = roll - fRmY
 }
 } else {
 // WARNING.  Not a unique solution.
 let fRpY: Storage.Value = atan2(-self[0][1], self[0][0])
 roll = radians(0.0)  // any angle works
 yaw = fRpY - roll
 }
 return Vector(yaw, pitch, roll)
 }

 @inlinable public var eulerAnglesZXY: Vector {
 /// https://github.com/OGRECave/ogre/blob/master/OgreMain/src/OgreMatrix3.cpp#L1135
 let yaw: Storage.Value
 let pitch: Storage.Value = asin(self[2][1])
 let roll: Storage.Value
 if  pitch < radians(.halfPi) {
 if pitch > radians(-.halfPi) {
 yaw = atan2(-self[0][1], self[1][1])
 roll = atan2(-self[2][0], self[2][2])
 } else {
 // WARNING.  Not a unique solution.
 let fRmY: Storage.Value = atan2(self[0][2], self[0][0])
 roll = radians(0.0)  // any angle works
 yaw = roll - fRmY
 }
 } else {
 // WARNING.  Not a unique solution.
 let fRpY: Storage.Value = atan2(self[0][2], self[0][0])
 roll = radians(0.0)  // any angle works
 yaw = fRpY - roll
 }
 return Vector(yaw, pitch, roll)
 }

 @inlinable public var eulerAnglesZYX: Vector {
 /// https://github.com/OGRECave/ogre/blob/master/OgreMain/src/OgreMatrix3.cpp#L1170
 let yaw: Storage.Value
 let pitch: Storage.Value = asin(-self[2][0])
 let roll: Storage.Value
 if pitch < radians(.halfPi) {
 if pitch > radians(-.halfPi) {
 yaw = atan2(self[1][0], self[0][0])
 roll = atan2(self[2][1], self[2][2])
 } else {
 // WARNING.  Not a unique solution.
 let fRmY: Storage.Value = atan2(-self[0][1], self[0][2])
 roll = radians(0.0);  // any angle works
 yaw = roll - fRmY
 }
 } else {
 // WARNING.  Not a unique solution.
 let fRpY: Storage.Value = atan2(-self[0][1], self[0][2])
 roll = radians(0.0);  // any angle works
 yaw = fRpY - roll
 }
 return Vector(yaw, pitch, roll)
 }
 }
 */
