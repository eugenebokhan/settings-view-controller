import UIKit

extension NSObject {
    static var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell {
    static var identifier: String {
        self.nameOfClass
    }
}

extension UITableView {
    func registerCell<T: UITableViewCell>(cell: T.Type) {
        self.register(cell, forCellReuseIdentifier: cell.identifier)
    }

    func dequeueCell<T: UITableViewCell>(cell: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
}
