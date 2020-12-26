import UIKit

public final class SettingsViewController: UINavigationController {

    public var settings: [Setting] {
        get { self.settingsTableViewController.settings }
        set { self.settingsTableViewController.settings = newValue }
    }
    public var contentHeight: CGFloat {
        self.settingsTableViewController.contentHeight
    }

    private let settingsTableViewController: SettingsTableViewController

    public init(settings: [Setting]) {
        self.settingsTableViewController = .init()
        super.init(rootViewController: self.settingsTableViewController)
        self.settings = settings

        self.navigationBar.topItem?.title = "Settings"
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                                         target: self,
                                                                         action: #selector(self.close))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func close() {
        self.dismiss(animated: true)
    }
    
}
