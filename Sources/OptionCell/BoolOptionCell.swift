import UIKit
import SnapKit

class BoolOptionCell: UITableViewCell, OptionCell {

    let optionName = UILabel()
    let `switch` = UISwitch()

    var option: BoolOption?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.setupInitialLayout()
        self.switch.addTarget(self,
                              action: #selector(valueChanged(_:)),
                              for: .valueChanged)

    }

    private func setupInitialLayout() {
        self.contentView.addSubview(self.optionName)
        self.contentView.addSubview(self.switch)
        self.optionName.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.equalToSuperview().inset(3)
            constraintMaker.leading.equalToSuperview().inset(8)
            constraintMaker.trailing.greaterThanOrEqualTo(self.switch).inset(16)
        }

        self.switch.snp.makeConstraints { constraintMaker in
            constraintMaker.trailing.equalToSuperview().inset(8)
        }
    }

    @objc
    private func valueChanged(_ sender: UISwitch) {
        self.option?.value = sender.isOn
    }

    public func configure(for option: Option) {
        guard let boolOption = option as? BoolOption
        else { fatalError("Wrong option was used for configuring the cell") }

        self.optionName.text = option.name
        self.switch.isOn = boolOption.value
        self.option = boolOption
    }
}
