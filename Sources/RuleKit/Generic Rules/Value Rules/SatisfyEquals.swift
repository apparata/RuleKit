//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule where Value: Equatable {
    
    static func equals(_ value: Value) -> Rule<Value> {
        return SatisfyEquals(value)
    }
    
    static func notEquals(_ value: Value) -> Rule<Value> {
        return .not(equals(value))
    }
}

private class SatisfyEquals<Value: Equatable>: Rule<Value> {
    
    private let value: Value
    
    init(_ value: Value) {
        self.value = value
        super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        return value == self.value
    }
}
