//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func either(_ ruleA: Rule<Value>, _ ruleB: Rule<Value>) -> Rule<Value> {
        return SatisfyEitherRule(ruleA, ruleB)
    }
}

private class SatisfyEitherRule<Value>: Rule<Value> {
    
    private let ruleA: Rule<Value>
    private let ruleB: Rule<Value>
    
    init(_ ruleA: Rule<Value>, _ ruleB: Rule<Value>) {
        self.ruleA = ruleA
        self.ruleB = ruleB
        super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        return ruleA.isSatisfied(for: value) || ruleB.isSatisfied(for: value)
    }
}
