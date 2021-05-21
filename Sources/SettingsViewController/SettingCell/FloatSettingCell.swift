import UIKit
import SnapKit

class FloatSettingCell: UITableViewCell, SettingCell {

    let containerView = UIView()
    let name = UILabel()
    let slider = UISlider()
    let valueLabel = UILabel()
    
    var format = "%.3f"
    
    var setting: FloatSetting?

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
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(self.doubleTapped))
        tap.numberOfTapsRequired = 2
        self.slider.addGestureRecognizer(tap)
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
        DispatchQueue.main.async {
            self.valueLabel.text = .init(format: self.format,
                                         sender.value)
            self.setting?.value = sender.value
        }
    }

    @objc
    func doubleTapped() {
        self.slider.setValue(self.setting?.defaultValue ?? .zero,
                             animated: true)

        self.valueChanged(self.slider)
    }

    func configure(for setting: Setting) {
        guard let floatSetting = setting as? FloatSetting
        else { return }
        
        self.setting = floatSetting

        self.slider.minimumValue = floatSetting.min
        self.slider.maximumValue = floatSetting.max
        self.slider.value = floatSetting.value

        self.valueLabel.text = .init(format: floatSetting.format,
                                     floatSetting.value)
        self.name.text = setting.name

        self.format = floatSetting.format
    }

    static let cellHeight: CGFloat = 114
}
