//
//  DetailsViewController.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 14/10/23.
//

import UIKit

class DetailsViewController: UIViewController {

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var ticker: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ticker"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .link
        return label
    }()
    
    private lazy var tickerValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 64, weight: .bold)
        label.textColor = .link
        label.textAlignment = .center
        return label
    }()
    
    private let model: LogoModel
    
    init(model: LogoModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.loadImage(url: model.imageURL)
        self.brandLabel.text = model.name
        self.tickerValue.text = model.ticker
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Detalhes"
        addSubViews()
        addConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(brandLabel)
        view.addSubview(ticker)
        view.addSubview(tickerValue)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            brandLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 36),
            brandLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            brandLabel.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor),
            
            ticker.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            ticker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            
            tickerValue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tickerValue.centerYAnchor.constraint(equalTo: ticker.centerYAnchor)
        ])
    }
}

#Preview {
    DetailsViewController(model: .init(name: "Apple", ticker: "AAPL", 
                                       imageURL: "https://api-ninjas-data.s3.us-west-2.amazonaws.com/logos/l476432a3e85a0aa21c23f5abd2975a89b6820d63.png"))
}
