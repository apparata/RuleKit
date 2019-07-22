//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule where Value: Comparable {
    
    static func atLeast(_ value: Value) -> Rule<Value> {
        return SatisfyAtLeast(value)
    }
}

private class SatisfyAtLeast<Value: Comparable>: Rule<Value> {
    
    private let value: Value
    
    init(_ value: Value) {
        self.value = value
        super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        return value <= self.value
    }
}
