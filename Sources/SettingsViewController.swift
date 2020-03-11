import UIKit
import SnapKit

public class SettingsViewController: UITableViewController {
    
    public var options: [Option] = []

    fileprivate var registeredTypes: [ObjectIdentifier: UITableViewCell.Type] = [:]

    fileprivate func register(cellType: UITableViewCell.Type,
                              for modelType: Option.Type) {
        let typeId = ObjectIdentifier(modelType)
        self.registeredTypes[typeId] = cellType
    }

    fileprivate func cellType(for modelType: Option.Type) -> UITableViewCell.Type? {
        let typeId = ObjectIdentifier(modelType)
        return self.registeredTypes[typeId]
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerCell(cell: BoolOptionCell.self)
        self.tableView.registerCell(cell: FloatOptionCell.self)
        self.tableView.registerCell(cell: SelectionOptionCell.self)

        self.register(cellType: BoolOptionCell.self, for: BoolOption.self)
        self.register(cellType: FloatOptionCell.self, for: FloatOption.self)
        self.register(cellType: SelectionOptionCell.self, for: SelectionOption.self)

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 140
    }

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        return "Options"
    }

    override public func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }

    override public func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentOption = self.options[indexPath.row]

        guard let cellType = self.cellType(for: type(of: currentOption)),
              let cell = self.tableView.dequeueCell(cell: cellType)
        else { return UITableViewCell() }

        (cell as? OptionCell)?.configure(for: currentOption)

        return cell
    }

    override public func tableView(_ tableView: UITableView,
                                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
