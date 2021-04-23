import Foundation

public protocol Setting: class {
    var name: String { get }
}

public extension FloatSetting {
    static func `for`<T>(object: T,
                         keyPath: ReferenceWritableKeyPath<T, Float>,
                         named name: String,
                         min: Float,
                         max: Float) -> FloatSetting {
        let setting = FloatSetting(name: name,
                                   defaultValue: object[keyPath: keyPath],
                                   min: min,
                                   max: max) {
            object[keyPath: keyPath] = $0
        }
        
        return setting
    }
}


public extension BoolSetting {
    static func `for`<T>(object: T,
                         keyPath: ReferenceWritableKeyPath<T, Bool>,
                         named name: String) -> BoolSetting {
        let setting = BoolSetting(name: name,
                                  initialValue: object[keyPath: keyPath]) {
            object[keyPath: keyPath] = $0
        }
        
        return setting
    }
}
