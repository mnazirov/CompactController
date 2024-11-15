//
//  Created by Marat Nazirov on 14.11.2024.
//

import UIKit

final class PopOverViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["280pt", "150pt"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(valueChangedControl), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods

private extension PopOverViewController {
    func commonInit() {
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
    }
    
    func setupConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
    }
}

// MARK: - Actions

private extension PopOverViewController {
    @objc
    func valueChangedControl() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            preferredContentSize = CGSize(width: 300, height: 280)
        case 1:
            preferredContentSize = CGSize(width: 300, height: 150)
        default:
            break
        }
    }
    
    @objc 
    func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
}
