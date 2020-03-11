import Foundation

public class SelectionOption: Option {
    public typealias Handler = (Int) -> Void
    public var name: String
    public var segments: [String]

    public internal(set) var value: Int {
        didSet {
            self.onChangeHandler?(self.value)
        }
    }

    public var onChangeHandler: Handler?

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
