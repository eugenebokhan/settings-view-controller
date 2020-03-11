import UIKit
import SnapKit

class FloatOptionCell: UITableViewCell, OptionCell {

    // MARK: - UI Properties

    let name = UILabel()
    let slider = UISlider()
    let valueLabel = UILabel()

    var option: FloatOption?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.setupInitialLayout()
        self.slider
            .addTarget(self,
                       action: #selector(valueChanged(_:)),
                       for: .valueChanged)

    }


    private func setupInitialLayout() {
        self.contentView.addSubview(self.name)
        self.contentView.addSubview(self.slider)
        self.contentView.addSubview(self.valueLabel)

        self.name.snp.makeConstraints { constraintMaker in
            constraintMaker.top.equalToSuperview().inset(3)
            constraintMaker.leading.equalToSuperview().inset(16)
            constraintMaker.bottom.equalTo(self.slider).inset(16)
        }

        self.slider.snp.makeConstraints { constraintMaker in
            constraintMaker.bottom.equalToSuperview().inset(8)
            constraintMaker.leading.trailing.equalToSuperview().inset(16)
        }

        self.valueLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.top.equalToSuperview().inset(3)
            constraintMaker.trailing.equalToSuperview().inset(16)
            constraintMaker.bottom.equalTo(self.slider).inset(16)
        }
    }

    @objc
    private func valueChanged(_ sender: UISlider) {
        self.valueLabel.text = "\(slider.value)"
        self.option?.value = sender.value
    }

    func configure(for option: Option) {
        guard let floatOption = option as? FloatOption
        else { return }

        self.slider.minimumValue = floatOption.min
        self.slider.maximumValue = floatOption.max
        self.slider.value = floatOption.value

        self.valueLabel.text = "\(floatOption.value)"
        self.name.text = option.name

        self.option = floatOption
    }
}
