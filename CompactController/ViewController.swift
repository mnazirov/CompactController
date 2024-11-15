//
//  Created by Marat Nazirov on 13.11.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(mainButtonDidTup), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods

private extension ViewController {
    func commonInit() {
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(mainButton)
    }
    
    func setupConstraints() {
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupPopover(for controller: UIViewController) {
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = CGSize(width: 300, height: 280)

        controller.popoverPresentationController?.delegate = self
        controller.popoverPresentationController?.sourceView = mainButton
        controller.popoverPresentationController?.permittedArrowDirections = .up
        controller.popoverPresentationController?.sourceRect = CGRect(
            x: mainButton.bounds.midX,
            y: mainButton.bounds.maxY,
            width: 0,
            height: 0
        )
    }
}

// MARK: - Actions

private extension ViewController {
    @objc
    func mainButtonDidTup() {
        let compactViewController = PopOverViewController()
        setupPopover(for: compactViewController)
        present(compactViewController, animated: true)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
