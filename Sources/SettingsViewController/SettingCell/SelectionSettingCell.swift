import UIKit
import SnapKit

class SelectionSettingCell: UITableViewCell, SettingCell {

    let containerView = UIView()
    let name = UILabel()
    let segmentedControl = UISegmentedControl()

    var option: SelectionSetting?

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
        self.segmentedControl.addTarget(self,
                                        action: #selector(valueChanged(_:)),
                                        for: .valueChanged)
        self.setupLayout()
    }

    private func setupLayout() {
        self.contentView.addSubview(self.containerView)
        self.containerView.backgroundColor = .tertiarySystemFill
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true

        self.containerView.addSubview(self.name)
        self.containerView.addSubview(self.segmentedControl)
        
        self.containerView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.equalToSuperview().inset(8)
            constraintMaker.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.name.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.top.equalToSuperview().inset(16)
        }

        self.segmentedControl.snp.makeConstraints { constraintMaker in
            constraintMaker.bottom.trailing.leading.equalToSuperview().inset(16)
            constraintMaker.height.equalTo(40)
        }
    }

    @objc
    private func valueChanged(_ sender: UISegmentedControl) {
        self.option?.value = sender.selectedSegmentIndex
    }

    func configure(for option: Setting) {
        guard let selectionOption = option as? SelectionSetting
        else { return }

        self.segmentedControl.removeAllSegments()
        for i in 0 ..< selectionOption.segments.count {
            self.segmentedControl.insertSegment(withTitle: selectionOption.segments[i],
                                                at: i,
                                                animated: false)
        }

        self.segmentedControl.selectedSegmentIndex = selectionOption.value
        self.name.text = option.name
        self.option = selectionOption
    }

    static let cellHeight: CGFloat = 124
}
