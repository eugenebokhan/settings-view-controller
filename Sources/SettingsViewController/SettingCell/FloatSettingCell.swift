import UIKit
import SnapKit

class FloatSettingCell: UITableViewCell, SettingCell {

    let containerView = UIView()
    let name = UILabel()
    let slider = UISlider()
    let valueLabel = UILabel()
    var format = "%.3f"

    var option: FloatSetting?

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
        self.slider.addTarget(self,
                              action: #selector(self.valueChanged(_:)),
                              for: .valueChanged)
        self.setupLayout()
    }

    private func setupLayout() {
        self.contentView.addSubview(self.containerView)
        self.containerView.backgroundColor = .tertiarySystemFill
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true

        self.containerView.addSubview(self.name)
        self.containerView.addSubview(self.slider)
        self.containerView.addSubview(self.valueLabel)

        self.containerView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.equalToSuperview().inset(8)
            constraintMaker.leading.trailing.equalToSuperview().inset(20)
        }

        self.name.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.top.equalToSuperview().inset(16)
        }

        self.valueLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.trailing.top.equalToSuperview().inset(16)
        }

        self.slider.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }

    @objc
    private func valueChanged(_ sender: UISlider) {

        self.valueLabel.text = .init(format: format,
                                     self.slider.value)
        self.option?.value = sender.value
    }

    func configure(for option: Setting) {
        guard let floatOption = option as? FloatSetting
        else { return }

        self.format = floatOption.format
        self.slider.minimumValue = floatOption.min
        self.slider.maximumValue = floatOption.max
        self.slider.value = floatOption.value

        self.valueLabel.text = .init(format: format,
                                     floatOption.value)
        self.name.text = option.name

        self.option = floatOption
    }

    static let cellHeight: CGFloat = 114
}
