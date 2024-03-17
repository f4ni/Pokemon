//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Furkan ic on 17.03.2024.
//

import UIKit
import Kingfisher

@objc(NamespacedDetailViewController)
class DetailViewController: UIViewController {
    
    var pokemon: PokemonDataModel?
    
    convenience init(pokemon: PokemonDataModel?) {
        self.init(nibName: nil, bundle: nil)
        // set up some stuff here
        self.pokemon = pokemon
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
    }
    
    func setupView() {
        view.backgroundColor = .white
        let detailView = DetailView()
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        if let url = URL(string: pokemon?.imageUrl ?? "") {
            detailView.imageView.kf.setImage(with: url)
        }
        if let description = pokemon?.description {
            detailView.descriptionLabel.text = description
        }
    }
}
