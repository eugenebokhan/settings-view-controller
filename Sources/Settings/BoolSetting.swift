import Foundation

public class BoolSetting: Setting {
    public typealias Handler = (Bool) -> Void

    public var name: String
    public internal(set) var value: Bool {
        didSet {
            self.onChangeHandler?(self.value)
        }
    }
    public var onChangeHandler: Handler?

    public init(name: String,
                initialValue: Bool,
                onChangeHandler: @escaping Handler) {
        self.name = name
        self.value = initialValue
        self.onChangeHandler = onChangeHandler
    }
}
