//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension FixedWidthInteger {
    
    func satisfies<Value>(_ rule: Rule<Value>) -> Bool where Value: FixedWidthInteger {
        return rule.isSatisfied(for: Value(self))
    }
}

// MARK: - Is Even Rule

// MARK: Int

public extension Rule where Value == Int {
    
    static let even: Rule = IsEvenIntRule()
    static let odd: Rule = .not(.even)
}

private class IsEvenIntRule: Rule<Int> {
    
    public override func isSatisfied(for value: Int) -> Bool {
        return value & 0x1 == 0
    }
}
