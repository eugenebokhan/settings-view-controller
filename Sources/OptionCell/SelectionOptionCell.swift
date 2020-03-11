import UIKit
import SnapKit

class SelectionOptionCell: UITableViewCell, OptionCell {

    let name = UILabel()
    let segmentedControl = UISegmentedControl()

    var option: SelectionOption?

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
        self.setupInitialLayout()
        self.segmentedControl
            .addTarget(self,
                       action: #selector(valueChanged(_:)),
                       for: .valueChanged)
    }

    private func setupInitialLayout() {
        self.contentView
            .addSubview(self.name)
        self.contentView
            .addSubview(self.segmentedControl)
        
        self.name.snp.makeConstraints { constraintMaker in
            constraintMaker.top.equalToSuperview().inset(3)
            constraintMaker.leading.equalToSuperview().inset(8)
            constraintMaker.bottom.equalTo(self.segmentedControl).inset(12)
        }

        self.segmentedControl.snp.makeConstraints { constraintMaker in
            constraintMaker.bottom.trailing.leading.equalToSuperview().inset(8)
            constraintMaker.height.equalTo(32)
        }
    }

    @objc
    private func valueChanged(_ sender: UISegmentedControl) {
        self.option?.value = sender.selectedSegmentIndex
    }

    func configure(for option: Option) {
        guard let selectionOption = option as? SelectionOption
        else { return }

        self.segmentedControl
            .removeAllSegments()
        for i in 0 ..< selectionOption.segments.count {
            self.segmentedControl
                .insertSegment(withTitle: selectionOption.segments[i],
                               at: i,
                               animated: false)
        }

        self.segmentedControl.selectedSegmentIndex = selectionOption.value

        self.name.text = option.name

        self.option = selectionOption
    }

}
