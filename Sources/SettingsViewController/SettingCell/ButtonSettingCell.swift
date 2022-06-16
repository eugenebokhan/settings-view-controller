import UIKit
import SnapKit

class ButtonSettingCell: UITableViewCell, SettingCell {

    let containerView = UIView()
    let name = UILabel()
    var button = UIButton()
        
    var setting: ButtonSetting?

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
        button = UIButton(configuration: .filled(), primaryAction: setting?.action)
        
        self.selectionStyle = .none
        self.setupLayout()
    }

    private func setupLayout() {
        self.contentView.addSubview(self.containerView)
        self.containerView.backgroundColor = .tertiarySystemFill
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true
        
        self.containerView.addSubview(self.name)
        self.containerView.addSubview(self.button)

        self.containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        self.name.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
        }

        self.button.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }

    func configure(for setting: Setting) {
        guard let buttonSetting = setting as? ButtonSetting
        else { return }
        
        self.setting = buttonSetting

        self.button.addAction(buttonSetting.action, for: .touchUpInside)
        
        self.name.text = buttonSetting.name
        self.button.setTitle(buttonSetting.title, for: .normal)
    }

    static let cellHeight: CGFloat = 114
}
