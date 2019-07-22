//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public class Rule<Value> {
    
    public init() {}
    
    public func isSatisfied(for value: Value) -> Bool {
        return false
    }
    
    public final func isNotSatisfied(for value: Value) -> Bool {
        return !isSatisfied(for: value)
    }
}
