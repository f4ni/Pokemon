//
//  OnboardingViewController.swift
//  Pokemon
//
//  Created by Furkan ic on 14.03.2024.
//

import UIKit
import SwiftUI

@objc(NamespacedOnboardingViewController)
final class OnboardingViewController: UIViewController {

    var viewModel = ViewModel()
    var swiftUIwillPresent = true
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavigationController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    private func getData() {
        viewModel.getData(){
            self.swiftUIwillPresent
            ? self.navigateToSwiftUI()
            : self.navigateToUIKit()
        }
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let containerView = OnboardingScreenButtonContainerView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    private func setupNavigationController() {
        navigationItem.title = "Pokemon"
    }
}

extension OnboardingViewController {
    func navigateToUIKit() {
        guard viewModel.pokemons != nil else { return }
        let uiKitViewController = UIKitViewController(viewModel: viewModel)
        navigationController?.pushViewController(uiKitViewController, animated: true)
        swiftUIwillPresent.toggle()
    }
    
    func navigateToSwiftUI() {
        guard viewModel.pokemons != nil else { return }
        let swiftUIViewController = UIHostingController(rootView: SwiftUIView(viewModel: viewModel))
        navigationController?.pushViewController(swiftUIViewController, animated: true)
        swiftUIwillPresent.toggle()
    }
}
