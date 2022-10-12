//
//  RegisterViewModel.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/11.
//

import Foundation
import Combine

enum RegisterState{
    case successful
    case failed(error: Error)
    case na
}

protocol RegisterViewModel {
    
    func register()
    var service: RegisterService {get}
    var state: RegisterState {get}
    var userDetails: RegisterDetails {get}
    init(service: RegisterService)
}

final class RegisterViewModelImpl: ObservableObject, RegisterViewModel{
    
    let service: RegisterService
    var state: RegisterState = .na
    @Published var userDetails: RegisterDetails = RegisterDetails.new
    
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegisterService) {
        self.service = service
    }
    
    func register() {
        
        service.register(with: userDetails)
            .sink { [weak self] res in
                switch res{
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            }receiveValue: { [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
    }
}
