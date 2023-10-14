//
//  ListLogoViewModel.swift
//  ProjectOne
//
//  Created by Alexandre Robaert on 12/10/23.
//

import Foundation

final class ListLogoViewModel {
    
    private let service: ServiceProtocol
    var dataSource: Observable<[LogoModel]> = Observable(value: [])
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    var dataSourceCount: Int {
        dataSource.value?.count ?? 0
    }
    
    func fetchLogo(filter: String) async throws {
        dataSource.value = try await service.request(FindLogoRequest.logo(name: filter))
    }
}
