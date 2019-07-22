//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func moreThan(_ count: Int, of rules: Rule<Value>...) -> Rule<Value> {
        return SatisfyMoreThanRules(count, of: rules)
    }
    
    static func moreThan(_ count: Int, of rules: AnySequence<Rule<Value>>) -> Rule<Value> {
        return SatisfyMoreThanRules(count, of: rules)
    }
}

private class SatisfyMoreThanRules<Value>: Rule<Value> {
    
    private let rules: AnySequence<Rule<Value>>
    private let count: Int
    
    init<RuleSequence: Sequence>(_ count: Int, of rules: RuleSequence)
        where RuleSequence.Element == Rule<Value> {
            self.rules = AnySequence<Rule<Value>>(rules)
            self.count = count
            super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        guard count >= 0 else {
            return false
        }
        var satisfiedCount = 0
        for rule in rules {
            if rule.isSatisfied(for: value) {
                satisfiedCount += 1
                if satisfiedCount > count {
                    return true
                }
            }
        }
        return false
    }
}
