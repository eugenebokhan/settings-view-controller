import Foundation

public class SelectionSetting: Setting {
    public typealias Handler = (Int) -> Void

    public let name: String
    public let segments: [String]
    public internal(set) var value: Int {
        didSet { self.onChangeHandler(self.value) }
    }
    public let onChangeHandler: Handler

    public init(name: String,
                initialValue: Int,
                segments: [String],
                onChangeHandler: @escaping Handler) {
        self.name = name
        self.segments = segments
        self.value = initialValue
        self.onChangeHandler = onChangeHandler
    }
}
