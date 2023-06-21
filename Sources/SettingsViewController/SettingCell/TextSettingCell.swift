//
//  TextSettingCell.swift
//  JWTikTak
//
//  Created by Amitai Blickstein on 6/16/22.
//

import UIKit
import SnapKit

class TextSettingCell: UITableViewCell, SettingCell {
    
    let containerView = UIView()
    let myTextLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(containerView)
        containerView.backgroundColor     = .tertiarySystemFill
        containerView.layer.cornerRadius  = 10
        containerView.layer.masksToBounds = true
        
        containerView.addSubview(myTextLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        myTextLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
        
    public func configure(for option: Setting) {
        guard let textOption = option as? TextSetting
        else { fatalError("Wrong option was used for configuring the cell") }
        
        myTextLabel.numberOfLines = 2
        myTextLabel.text = "\(textOption.name)\n\(textOption.value)"
        myTextLabel.sizeToFit()
    }
    
    static let cellHeight: CGFloat = 68
}
