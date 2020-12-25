import Foundation

public class BoolSetting: Setting {
    public typealias Handler = (Bool) -> Void

    public let name: String
    public internal(set) var value: Bool {
        didSet { self.onChangeHandler(self.value) }
    }
    public let onChangeHandler: Handler

    public init(name: String,
                initialValue: Bool,
                onChangeHandler: @escaping Handler) {
        self.name = name
        self.value = initialValue
        self.onChangeHandler = onChangeHandler
    }
}
