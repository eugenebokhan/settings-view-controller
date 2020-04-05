import UIKit
import SnapKit

class BoolSettingCell: UITableViewCell, SettingCell {

    let containerView = UIView()
    let optionName = UILabel()
    let `switch` = UISwitch()

    var option: BoolSetting?

    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.selectionStyle = .none
        self.switch.addTarget(self,
                              action: #selector(self.valueChanged(_:)),
                              for: .valueChanged)
        self.setupLayout()
    }

    private func setupLayout() {
        self.contentView.addSubview(self.containerView)
        self.containerView.backgroundColor = .tertiarySystemFill
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true

        self.containerView.addSubview(self.optionName)
        self.containerView.addSubview(self.switch)

        self.containerView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.equalToSuperview().inset(8)
            constraintMaker.leading.trailing.equalToSuperview().inset(20)
        }

        self.switch.snp.makeConstraints { constraintMaker in
            constraintMaker.trailing.equalToSuperview().inset(16)
            constraintMaker.centerY.equalToSuperview()
        }

        self.optionName.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview().inset(16)
            constraintMaker.trailing.lessThanOrEqualTo(self.switch.snp.leading).inset(16)
            constraintMaker.centerY.equalToSuperview()
        }
    }

    @objc
    private func valueChanged(_ sender: UISwitch) {
        self.option?.value = sender.isOn
    }

    public func configure(for option: Setting) {
        guard let boolOption = option as? BoolSetting
        else { fatalError("Wrong option was used for configuring the cell") }

        self.optionName.text = option.name
        self.switch.isOn = boolOption.value
        self.option = boolOption
    }

    static let cellHeight: CGFloat = 68
}
