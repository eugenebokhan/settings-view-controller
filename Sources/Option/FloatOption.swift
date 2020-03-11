import Foundation

public class FloatOption: Option {
    public typealias Handler = (Float) -> Void
    public var name: String
    public var min: Float
    public var max: Float
    public internal(set) var value: Float {
        didSet { self.onChangeHandler?(self.value) }
    }
    public var onChangeHandler: (Handler)?

    public init(name: String,
                initialValue: Float,
                min: Float,
                max: Float, 
                onChangeHandler: @escaping Handler) {
        self.name = name
        self.min = min
        self.max = max
        self.value = initialValue
        self.onChangeHandler = onChangeHandler
    }
}
