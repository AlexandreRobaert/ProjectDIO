//
//  ListLogoViewController.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 08/10/23.
//

import UIKit

final class ListLogoViewController: UIViewController {
    
    private lazy var rootStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var titleList: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        label.text = "Pesquisa de marcas"
        return label
    }()
    
    private lazy var search: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Pesquise sua marca"
        search.delegate = self
        search.isTranslucent = false
        search.sizeToFit()
        return search
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: LogoTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: LogoTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let viewModel = ListLogoViewModel(service: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.dataSource.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Pesquisar"
        view.addSubview(rootStack)
        rootStack.addArrangedSubview(titleList)
        rootStack.addArrangedSubview(search)
        rootStack.addArrangedSubview(tableView)
        
        NSLayoutConstraint.activate([
            rootStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            rootStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            rootStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            rootStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
    
    private func fetchLogo(text: String) {
        Task {
            do {
                try await viewModel.fetchLogo(filter: text)
            } catch let error as NetworkError {
                print("Erro ->", error.description)
            }
        }
    }
}

// MARK: Extension

extension ListLogoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogoTableViewCell.identifier, for: indexPath)
        if let cell = cell as? LogoTableViewCell, let model = viewModel.dataSource.value?[indexPath.row] {
            cell.setupCell(model: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let model = viewModel.dataSource.value?[indexPath.row] {
            print("Click ->", model.name)
        }
    }
}


extension ListLogoViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            fetchLogo(text: text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.dataSource.value = []
    }
}
