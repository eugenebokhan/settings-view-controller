import Foundation

public class TextSetting: Setting {
    
    public typealias Handler = (String) -> Void

    public let name: String
    public internal(set) var value: String {
        didSet { self.onChangeHandler(self.value) }
    }
    public let onChangeHandler: Handler

    public init(name: String,
                initialValue: String,
                onChangeHandler: @escaping Handler) {
        self.name = name
        self.value = initialValue
        self.onChangeHandler = onChangeHandler
    }
}
