import UIKit
import SnapKit

public class SettingsTableViewController: UITableViewController {
    
    public var settings: [Setting] = []
    public var contentHeight: CGFloat {
        self.settings.compactMap { Self.cellType(for: type(of: $0))?.cellHeight }.reduce(0, +)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerCell(cell: BoolSettingCell.self)
        self.tableView.registerCell(cell: FloatSettingCell.self)
        self.tableView.registerCell(cell: SelectionSettingCell.self)

        self.tableView.separatorColor = .clear
    }

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(_ tableView: UITableView,
                                   numberOfRowsInSection section: Int) -> Int {
        return self.settings.count
    }

    override public func tableView(_ tableView: UITableView,
                                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentOption = self.settings[indexPath.row]

        guard let cellType = Self.cellType(for: type(of: currentOption)) as? UITableViewCell.Type,
              let cell = self.tableView.dequeueCell(cell: cellType)
        else { return .init() }

        (cell as? SettingCell)?.configure(for: currentOption)

        return cell
    }

    override public func tableView(_ tableView: UITableView,
                                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Self.cellType(for: type(of: self.settings[indexPath.row]))?.cellHeight ?? 30
    }

    private static var registeredTypes: [ObjectIdentifier: SettingCell.Type] = [
        ObjectIdentifier(BoolSetting.self): BoolSettingCell.self,
        ObjectIdentifier(FloatSetting.self): FloatSettingCell.self,
        ObjectIdentifier(SelectionSetting.self): SelectionSettingCell.self
    ]

    private static func cellType(for modelType: Setting.Type) -> SettingCell.Type? {
        let typeId = ObjectIdentifier(modelType)
        return Self.registeredTypes[typeId]
    }

}
