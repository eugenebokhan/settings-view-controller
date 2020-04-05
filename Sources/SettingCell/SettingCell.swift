import Foundation

public protocol SettingCell {
    static var cellHeight: CGFloat { get }
    func configure(for option: Setting)
}
