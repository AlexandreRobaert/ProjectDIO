//
//  HomeViewController.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 07/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let service: ServiceProtocol = NetworkService()
    
    @IBAction func nextScreen(_ sender: UIButton) {
        Task {
            do {
                let result: [LogoResponse] = try await service.request(FindLogoRequest.logo(name: "apple"))
                print(result.first?.imageURL)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

