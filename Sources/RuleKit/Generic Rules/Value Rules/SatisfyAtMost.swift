//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule where Value: Comparable {
    
    static func atMost(_ value: Value) -> Rule<Value> {
        return SatisfyAtMost(value)
    }
}

private class SatisfyAtMost<Value: Comparable>: Rule<Value> {
    
    private let value: Value
    
    init(_ value: Value) {
        self.value = value
        super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        return value <= self.value
    }
}
