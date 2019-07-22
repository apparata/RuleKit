//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func exactlyOne(of rules: Rule<Value>...) -> Rule<Value> {
        return SatisfyExactlyOneRule(of: rules)
    }
    
    static func exactlyOne(of rules: AnySequence<Rule<Value>>) -> Rule<Value> {
        return SatisfyExactlyOneRule(of: rules)
    }
}

private class SatisfyExactlyOneRule<Value>: Rule<Value> {
    
    private let rules: AnySequence<Rule<Value>>
    
    init<RuleSequence: Sequence>(of rules: RuleSequence)
        where RuleSequence.Element == Rule<Value> {
            self.rules = AnySequence<Rule<Value>>(rules)
            super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        var satisfiedCount = 0
        for rule in rules {
            if rule.isSatisfied(for: value) {
                satisfiedCount += 1
                if satisfiedCount > 1 {
                    return false
                }
            }
        }
        return satisfiedCount == 1
    }
}

