import UIKit
import CustomHeightTransition

public final class SettingsViewController: UINavigationController {

    public var settings: [Setting] {
        get { self.settingsTableViewController.settings }
        set { self.settingsTableViewController.settings = newValue }
    }
    public var contentHeight: CGFloat {
        self.settingsTableViewController.contentHeight
    }

    private let settingsTableViewController: SettingsTableViewController
    private let transitioning: CustomHeightTransitioningDelegate

    public init(settings: [Setting]) {
        self.settingsTableViewController = .init()
        self.transitioning = .init()
        super.init(rootViewController: self.settingsTableViewController)
        self.settingsTableViewController.delegate = self
        self.settings = settings
        self.transitioning.customHeight = self.contentHeight + 166
        self.transitioning.showCloseButton = true
        self.transitioning.showIndicator = true
        self.transitioningDelegate = self.transitioning
        self.modalPresentationStyle = .custom
        self.modalPresentationCapturesStatusBarAppearance = true

        self.navigationBar.topItem?.title = "Settings"
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.topItem?.largeTitleDisplayMode = .always
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SettingsViewController: SettingsTableViewControllerDelegate {
    func adjustedContentInsetDidChange(adjustedContentInset: UIEdgeInsets) {
        let alpha = (adjustedContentInset.top - 70) / 26
        self.transitioning.closeButton?.alpha = alpha
        self.transitioning.indicator?.alpha = alpha
    }
}
