//
//  remap.swift
//  Math
//
//  Created by Math on 10.09.19.
//

extension FloatingPoint {
    @inlinable
    public func remaped(clampingIn rangeClamp: ClosedRange<Self>,
                        to rangeOut: ClosedRange<Self>) -> Self {
        var v = self.clamped(to: rangeClamp)
        v = v.lerped(from: rangeClamp, to: rangeOut)
        return v
    }

    @inlinable
    public mutating func remap(clampingIn rangeClamp: ClosedRange<Self>,
                               to rangeOut: ClosedRange<Self>) {
        self.clamp(to: rangeClamp)
        self.lerp(from: rangeClamp, to: rangeOut)
    }
}
