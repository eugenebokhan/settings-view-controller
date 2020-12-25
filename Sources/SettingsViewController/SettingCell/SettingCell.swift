import CoreGraphics

public protocol SettingCell {
    static var cellHeight: CGFloat { get }
    func configure(for option: Setting)
}
