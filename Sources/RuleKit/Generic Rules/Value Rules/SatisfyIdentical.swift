//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule where Value: AnyObject {
    
    static func identical(to value: Value) -> Rule<Value> {
        return SatisfyIdentical(to: value)
    }
    
    static func notIdentical(to value: Value) -> Rule<Value> {
        return .not(identical(to: value))
    }
}

private class SatisfyIdentical<Value: AnyObject>: Rule<Value> {
    
    private let value: Value
    
    init(to value: Value) {
        self.value = value
        super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        return value === self.value
    }
}
