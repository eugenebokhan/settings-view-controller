import Foundation
import UIKit

public class ButtonSetting: Setting {
    public typealias Handler = UIActionHandler

    public let name: String
    public let title: String
    public internal(set) var action: UIAction {
        didSet { self.onTapHandler(action) }
    }
    public let onTapHandler: Handler

    public init(name: String,
                title: String,
                onTapHandler: @escaping Handler) {
        self.name = name
        self.title = title
        self.onTapHandler = onTapHandler
        self.action = .init(handler: onTapHandler)
    }
}
