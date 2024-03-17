//
//  UIKitViewController.swift
//  Pokemon
//
//  Created by Furkan ic on 17.03.2024.
//

import UIKit
import Kingfisher

class UIKitViewController: UIViewController {
    
    var tableView = UITableView()
    
    var viewModel: ViewModel?
    
    convenience init(viewModel: ViewModel? = nil) {
        self.init(nibName: nil, bundle: nil)
        // set up some stuff here
        self.viewModel = viewModel ?? ViewModel()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Pokemon(UIKit)"
        prepareTableView()
        
    }
    
    func prepareTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "PokemonTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "PokemonTableViewCell")
    }
}

extension UIKitViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemon = viewModel?.pokemons?[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as? PokemonTableViewCell
        else {
            return UITableViewCell()
        }
        if let url = URL(string: pokemon.imageUrl ?? "") {
            cell.iView.kf.setImage(with: url)
        }
        cell.nameLabel.text = pokemon.name
        cell.descLabel.text = pokemon.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemon = viewModel?.pokemons?[indexPath.row] {
            let detailViewController = DetailViewController(pokemon: pokemon)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
